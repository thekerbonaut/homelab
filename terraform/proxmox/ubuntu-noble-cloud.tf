data "local_file" "ssh_public_key" {
  filename = "./id_homelab.pub"
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name      = "test-ubuntu"
  node_name = "elrond"

  initialization {

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = var.user
      password = var.pass
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  disk {
    datastore_id = "ceph-pool"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "elrond"

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}