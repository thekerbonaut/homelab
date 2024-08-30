data "local_file" "ssh_public_key" {
  filename = "./id_homelab.pub"
}

resource "proxmox_virtual_environment_vm" "k3s_nginx_lb" {
  name      = "k3s-nginx-lb"
  node_name = "celeborn"
  
  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_celeborn.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "k3s_master_01" {
  name      = "k3s-master-01"
  node_name = "celeborn"

  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_celeborn.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "k3s_agent_01" {
  name      = "k3s-agent-01"
  node_name = "celeborn"
  
  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_celeborn.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "k3s_master_02" {
  name      = "k3s-master-02"
  node_name = "elrond"
  
  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_elrond.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "k3s_agent_02" {
  name      = "k3s-agent-02"
  node_name = "elrond"
  
  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_elrond.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "k3s_master_03" {
  name      = "k3s-master-03"
  node_name = "galadriel"
  
  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_galadriel.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "k3s_agent_03" {
  name      = "k3s-agent-03"
  node_name = "galadriel"
  
  agent {
    enabled = true
  }

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
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_noble_cloud_galadriel.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_noble_cloud_celeborn" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "celeborn"

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_noble_cloud_elrond" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "elrond"

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_noble_cloud_galadriel" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "galadriel"

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}