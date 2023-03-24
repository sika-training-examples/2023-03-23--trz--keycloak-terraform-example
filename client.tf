module "client--foo" {
  source = "./modules/client"

  realm_id      = keycloak_realm.example.id
  client_id     = "foo"
  client_secret = ""
  access_type   = "PUBLIC"
  roles = [
    "admininstrator",
    "uzivatel",
  ]
}

module "client--bar" {
  source = "./modules/client"

  realm_id      = keycloak_realm.example.id
  client_id     = "bar"
  client_secret = ""
  access_type   = "PUBLIC"
  roles = [
    "editor",
    "viewer",
  ]
}

