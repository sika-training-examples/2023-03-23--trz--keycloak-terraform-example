resource "keycloak_group" "groups" {
  for_each = local.groups

  realm_id = keycloak_realm.example.id
  name     = each.key
}
