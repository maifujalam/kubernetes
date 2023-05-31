source "vagrant" "k8s" {    # Build k8s v 1.27.2 cluster with master components.
  source_path = "generic/rhel9"
  box_name = "rhel_9_box"
  communicator = "ssh"
  provider = "virtualbox"
  add_force = true
  box_version = "v4.2.16"
}

build {
  name = "k8s_build"
  sources = ["source.vagrant.k8s"]
  provisioner "shell" {
    inline = ["echo HelloWorld"]
  }
  provisioner "shell" {
    script       = "scripts/main.sh"
    pause_before = "1s"
    timeout      = "1s"
  }
}