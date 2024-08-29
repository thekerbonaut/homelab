resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name      = "test-ubuntu"
  node_name = "elrond"

  initialization {
    user_account {
      # do not use this in production, configure your own ssh key instead!
      username = var.user
      password = var.pass
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
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "elrond"
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}