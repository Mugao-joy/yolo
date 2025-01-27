provider "virtualbox" {}

resource "virtualbox_vm" "ansible_vm" {
  name   = "ansible_vm"
  memory = 1024
  cpus   = 2
  disk_size = 10000
  network_interface {
    type = "hostonly"
    host_interface = "vboxnet0"
  }
}

resource "null_resource" "ansible_provision" {
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory site.yml"
  }
  depends_on = [virtualbox_vm.ansible_vm]
}
