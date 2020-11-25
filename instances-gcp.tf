variable "gcp_config" {
}

resource "google_compute_instance" "vm_instance" {
  name         = "gcp-demo-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "vm_iterated_instance" {
  for_each     = {
    instance_a = "A"
    instance_b = "B"
  }
  
  name         = "gcp-demo-instance-${each.value}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
