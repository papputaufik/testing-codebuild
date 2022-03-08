resource "google_compute_instance" "test-vm-cd4"{
  name         = "test-vm-cd1"
  project	= "bamboo-weft-341407"
  provider     = google-beta
  machine_type = "e2-medium"  
  zone         = "us-central1-a"
  tags         = ["test-vm"]

  network_interface {
    network = "default"
    access_config {
      
    }

  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  attached_disk {
    source = google_compute_disk.additional-disk.id
  }
}
resource "google_compute_disk" "additional-disk" {
  name = "test-disk14"
  project = "bamboo-weft-341407"
  type = "pd-ssd"
  zone = "us-central1-a"
  size = 25
}


