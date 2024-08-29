terraform {

    required_version = ">= 1.9.5"

    required_providers {
        proxmox = {
            source = "bpg/proxmox"
            version = "0.63.0"
        }
    }
}

variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
}

variable "proxmox_api_token" {
    type = string
}

variable "PUBLIC_SSH_KEY" {
    type = string
}

variable "user" {
    type = string
}

variable "pass" {
    type = string
}

variable "proxmox_virtual_environment_endpoint_elrond" {
    type = string
}

variable "proxmox_virtual_environment_endpoint_galadriel" {
    type = string
}

variable "proxmox_virtual_environment_endpoint_celeborn" {
    type = string
}

variable "proxmox_virtual_environment_username" {
    type = string
}

variable "proxmox_virtual_environment_password" {
    type = string
}

provider "proxmox" {
  endpoint = var.proxmox_virtual_environment_endpoint_elrond
  username = var.proxmox_virtual_environment_username
  password = var.proxmox_virtual_environment_password
  # because self-signed TLS certificate is in use
  insecure = true
  # uncomment (unless on Windows...)
  tmp_dir  = "/var/tmp"

  ssh {
    agent = true
    # TODO: uncomment and configure if using api_token instead of password
    # username = "root"
  }
}