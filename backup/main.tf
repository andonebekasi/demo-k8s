provider "google" {

  project = "playground-s-11-714af492"

  region  = "asia-southeast1"

}

resource "google_compute_instance" "my_vm" {
  count        =  3
  name         = "cka-k8s${count.index}"

  machine_type = "n1-standard-2"

  zone         = "asia-southeast1-b"

  metadata = {
     ssh-keys = "andi:ssh-rsa AAAABxyxoEm1hcGLYebTsPeBpeGOgjbXKLPUZrN7VWqHZQZULZtLLYQdz7E0wTfw01/KmxkIZ5fzt16cPEWr1UUmIpU411+dA9y8quI7rN2Z2FaGJgBQ== andi"
   }

  boot_disk {

    initialize_params {

      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20210603"

    }

  }

  // Make sure flask is installed on all new instances for later steps
   metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq ansible"

  network_interface {

    network = "default"

    access_config {}

  }

}

