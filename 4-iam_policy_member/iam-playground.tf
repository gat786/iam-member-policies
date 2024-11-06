# > g projects get-iam-policy curious-checking-stuff --format json
# {
#   "bindings": [
#     {
#       "members": [
#         "user:me@gats.dev"
#       ],
#       "role": "roles/cloudsql.admin"
#     },
#     {
#       "condition": {
#         "description": "Expiring at midnight of 2025-01-01",
#         "expression": "request.time < timestamp('2025-01-01T00:00:00Z')",
#         "title": "expires_after_2025_01_01"
#       },
#       "members": [
#         "user:ganesht049@gmail.com"
#       ],
#       "role": "roles/cloudsql.admin"
#     },
#     {
#       "members": [
#         "user:ganesht049@gmail.com"
#       ],
#       "role": "roles/owner"
#     }
#   ],
#   "etag": "BwYmNsIg5k4=",
#   "version": 3
# }

resource "google_project_iam_member" "cloudsql_instanceuser" {
  project = var.project
  role    = "roles/cloudsql.instanceUser"
  member  = "user:ganesht049@gmail.com"
}

resource "google_project_iam_member" "cloudsql_instanceuser2" {
  project = var.project
  role    = "roles/cloudsql.instanceUser"
  member  = "user:me@gats.dev"
}

# after applying the above terraform code.
# > g projects get-iam-policy curious-checking-stuff --format json
# {
#   "bindings": [
#     {
#       "members": [
#         "user:me@gats.dev"
#       ],
#       "role": "roles/cloudsql.admin"
#     },
#     {
#       "condition": {
#         "description": "Expiring at midnight of 2025-01-01",
#         "expression": "request.time < timestamp('2025-01-01T00:00:00Z')",
#         "title": "expires_after_2025_01_01"
#       },
#       "members": [
#         "user:ganesht049@gmail.com"
#       ],
#       "role": "roles/cloudsql.admin"
#     },
#     {
#       "members": [
#         "user:ganesht049@gmail.com"
#       ],
#       "role": "roles/cloudsql.instanceUser"
#     },
#     {
#       "members": [
#         "user:ganesht049@gmail.com",
#         "user:me@gats.dev"
#       ],
#       "role": "roles/owner"
#     }
#   ],
#   "etag": "BwYmQk121oc=",
#   "version": 3
# }
