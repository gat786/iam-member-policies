resource "google_secret_manager_secret" "example_secret" {
  secret_id = "example-secret"
  replication {
    auto {}
  }
}
