resource "google_sql_database_instance" "test-instance" {
  # postgres intance 
  name             = "test-instance"
  database_version = "POSTGRES_13"
  region           = "asia-south1"
  project          = var.project
  settings {
    tier = "db-f1-micro"
  }
}
