/*
    TEMPLATE TO BUILD A UBUNTU 20.04 VAGRANT BOX.
*/

/* Defining provider section*/
packer {
  required_plugins {
    virtualbox-iso = {
      version      = ">= 0.0.1"
      source       = "github.com/hashicorp/vagrant"
    }
  }
}

/* Defining build section*/
source "virtualbox-iso" "autogenerated" {
  provider               = var.provider
  iso_url                = var.iso_url
  iso_checksum           = var.iso_checksum
  http_directory         = var.http_directory
  communicator           = var.communicator
  ssh_username           = var.ssh_username
  ssh_password           = var.ssh_password
  ssh_timeout            = var.ssh_timeout
  ssh_wait_timeout       = var.ssh_wait_timeout
  ssh_handshake_attempts = var.ssh_handshake_attempts
  vboxmanage             = [["modifyvm", "", "--memory", "512"], ["modifyvm", "", "--cpus", "1"]]
  shutdown_command       = "echo vagrant | sudo -S shutdown -P now"
  boot_wait              = "10s"
  boot_command = [
    "<enter><wait>",
    "<f6><esc>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs>",
    "linux /casper/vmlinuz --- autoinstall ds=nocloud;s=/cidata/",
    "cd_files=[\"http/user-data\", \"http/meta-data\"]",
    "cd_label=cidata",
    "floppy_files=[\"http/user-data\", \"http/meta-data\"]",
    "floppy_label=cidata",
    "<enter>",
    "<enter><f10><wait>"
  ]
  source_path = var.source_path
}

build {
  sources = [
    "source.virtualbox-iso.autogenerated"
  ]

/* Defining provisioner section*/
  provisioner "shell" {
    inline = [
      "sleep 30",
      "echo '[✓] Provisioning...' > /tmp/provision.log",
      "apt update >> /tmp/provision.log 2>&1",
      "apt upgrade -y >> /tmp/provision.log 2>&1",
      "apt install open-vm-tools -y >> /tmp/provision.log 2>&1"
    ]
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | sudo -S sh"
    scripts = [
      "scripts/setup.sh",
      "scripts/tasks.sh"
    ]
  }

/* Defining output section*/
  post-processor "vagrant" {
    output = "virtualbox-iso/ubuntu_20-04-amd64.box"
  }
}

/* Defining variables section */
variable "provider" {
  type    = string
  default = "virtualbox"
}


variable "name" {
  type    = string
  default = "virtualbox-template"
}

variable "format" {
  type    = string
  default = "ova"
}

variable "http_directory" {
  type    = string
  default = "./http"
}

variable "cd_files" {
  type    = list(string)
  default = ["http/user-data", "http/meta-data"]
}

variable "cd_label" {
  type    = string
  default = "cidata"
}

variable "floppy_files" {
  type    = list(string)
  default = ["http/user-data", "http/meta-data"]
}

variable "floppy_label" {
  type    = string
  default = "cidata"
}


variable "output_directory" {
  type    = string
  default = "virtualbox-iso"
}

variable "iso_checksum" {
  type    = string
  default = "sha256:b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-live-server-amd64.iso"
}

variable "communicator" {
  type    = string
  default = "ssh"
}

variable "ssh_port" {
  type    = string
  default = "22"
}

variable "ssh_username" {
  type    = string
  default = "vagrant"
}

variable "ssh_password" {
  type    = string
  default = "vagrant"
}

variable "ssh_timeout" {
  type    = string
  default = "10m"
}

variable "ssh_wait_timeout" {
  type    = string
  default = "20m"
}

variable "ssh_handshake_attempts" {
  type    = string
  default = "50"
}

variable "source_path" {
  type    = string
  default = "packer_cache/74137c86f91d35e79617069ca73ab76607b2949f.iso"
}

variable "headless" {
  type    = string
  default = false
}