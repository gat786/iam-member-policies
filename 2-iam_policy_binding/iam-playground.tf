# before applying this policy, the output of the below command will be:
# > g projects get-iam-policy curious-checking-stuff --format json
# {
#   "bindings": [
#     {
#       "members": [
#         "user:ganesht049@gmail.com"
#       ],
#       "role": "roles/owner"
#     }
#   ],
#   "etag": "BwYmBmsFodo=",
#   "version": 1
# }

resource "google_project_iam_binding" "cloudsql_admin" {
  project = var.project
  role    = "roles/cloudsql.admin"
  members = [
    "user:ganesht049@gmail.com" 
  ]
}

resource "google_project_iam_binding" "cloudsql_admin_cond" {
  project = var.project
  role    = "roles/cloudsql.admin"
  members = [
    "user:ganesht049@gmail.com"
  ]

  condition {
    title       = "expires_after_2025_01_01"
    description = "Expiring at midnight of 2025-01-01"
    expression  = "request.time < timestamp('2025-01-01T00:00:00Z')"
  }
}

# after applying this policy, the output of the below command will be:
# > g projects get-iam-policy curious-checking-stuff --format json
# {
#   "bindings": [
#     {
#       "members": [
#         "user:ganesht049@gmail.com"
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
#   "etag": "BwYmNrGVGag=",
#   "version": 3
# }
