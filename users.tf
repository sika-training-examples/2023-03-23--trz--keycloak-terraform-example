resource "keycloak_user" "users" {
  for_each = local.users

  realm_id = keycloak_realm.example.id
  username = each.key
  enabled  = each.value.enabled

  email          = each.value.email
  email_verified = true
  first_name     = each.value.first_name
  last_name      = each.value.last_name

  initial_password {
    value     = "a"
    temporary = true
  }
}
