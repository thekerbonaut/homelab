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

provider "proxmox" {

    endpoint = var.proxmox_api_url
    api_token = var.proxmox_api_token
    # (Optional) Skip TLS Verification
    insecure = true
    ssh {
        agent = true
        username = "root"
    }

    tmp_dir = "/var/tmp"

}