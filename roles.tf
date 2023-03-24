resource "keycloak_role" "roles" {
  for_each = local.roles

  realm_id = keycloak_realm.example.id
  name     = each.key
}

resource "keycloak_role" "administrator" {
  realm_id = keycloak_realm.example.id
  name     = "administrator"

  composite_roles = [
    keycloak_role.uzivatel.id,
  ]
}

resource "keycloak_role" "uzivatel" {
  realm_id = keycloak_realm.example.id
  name     = "uzivatel"
}
