# resource "google_secret_manager_secret_iam_member" "simple-member" {
#   secret_id = google_secret_manager_secret.example_secret.id
#   role      = "roles/secretmanager.secretAccessor"
#   member    = "user:ganesht049@gmail.com"
# }

# > g projects get-iam-policy curious-checking-stuff --format json 
# {
#   "bindings": [
#     {
#       "members": [
#         "serviceAccount:service-641833792648@gcp-sa-artifactregistry.iam.gserviceaccount.com"
#       ],
#       "role": "roles/artifactregistry.serviceAgent"
#     },
#     {
#       "members": [
#         "serviceAccount:service-641833792648@compute-system.iam.gserviceaccount.com"
#       ],
#       "role": "roles/compute.serviceAgent"
#     },
#     {
#       "members": [
#         "serviceAccount:641833792648-compute@developer.gserviceaccount.com",
#         "serviceAccount:641833792648@cloudservices.gserviceaccount.com"
#       ],
#       "role": "roles/editor"
#     },
#     {
#       "members": [
#         "user:ganesht049@gmail.com"
#       ],
#       "role": "roles/owner"
#     }
#   ],
#   "etag": "BwYmA_Ah2Ys=",
#   "version": 1
# }

data "google_iam_policy" "policy_for_project" {
  binding {
    role = "roles/owner"
    members = [
      "user:ganesht049@gmail.com"
    ]
  }
}

resource "google_project_iam_policy" "policy_for_project" {
  project     = var.project
  policy_data = data.google_iam_policy.policy_for_project.policy_data
}  


