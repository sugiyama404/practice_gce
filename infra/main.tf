terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# iam
module "iam" {
  source                                 = "./modules/iam"
  project_id                             = var.project_id
  region                                 = var.region
  compute_engine_default_service_account = var.compute_engine_default_service_account
}

# network
module "network" {
  source = "./modules/network"
  region = var.region
}

# GCE
module "gce" {
  source                = "./modules/gce"
  service_account_email = module.iam.service_account_email
  zone                  = var.zone
  vpc_network_name      = module.network.vpc_network_name
  subnet_sg_name        = module.network.subnet_sg_name
}
