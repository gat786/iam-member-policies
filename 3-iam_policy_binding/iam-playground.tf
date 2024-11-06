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

resource "google_project_iam_binding" "cloudsql_admin_again" {
  project = "curious-checking-stuff"
  role    = "roles/cloudsql.admin"
  members = [
    "user:me@gats.dev"
  ]
}
