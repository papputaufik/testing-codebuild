resource "google_compute_instance" "test-vm-cd" {
  name         = "test-vm-cd"
  project	= "np-fi-corp-controller"
  provider     = google-beta
  machine_type = "custom-4-8192"
  zone         = "us-central1-a"
  tags         = ["test-vm"]

  network_interface {
    network = "default"
    subnetwork = "np-fi-corp-controller-us-central1"
    access_config {
      
    }

  }
  boot_disk {
    initialize_params {
      image = "windows-server-2019-dc-v20200609"
      type  = "pd-ssd"
      size  = 75
    }
  }
  attached_disk {
    source = google_compute_disk.additional-disk.id
  }
 }

resource "google_compute_disk" "additional-disk" {
  name = "test-disk"
  project = "np-fi-corp-controller"
  type = "pd-ssd"
  zone = "us-central1-a"
  size = 25
}


