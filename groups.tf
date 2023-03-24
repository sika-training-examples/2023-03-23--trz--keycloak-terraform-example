module "group--admins" {
  source = "./modules/group"

  realm_id = keycloak_realm.example.id
  name     = "admins"
  role_ids = [
    module.client--foo.roles["administrator"].id,
    module.client--bar.roles["editor"].id,
  ]
}

module "group--viewers" {
  source = "./modules/group"

  realm_id = keycloak_realm.example.id
  name     = "viewers"
  role_ids = [
    module.client--foo.roles["uzivatel"].id,
    module.client--bar.roles["viewer"].id,
  ]
}
