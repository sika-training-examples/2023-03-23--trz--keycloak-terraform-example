resource "keycloak_openid_client" "example" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "example"
  client_secret                   = "example"
  enabled                         = true
  standard_flow_enabled           = true
  access_type                     = "PUBLIC" # or "CONFIDENTIAL"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}

resource "keycloak_openid_client_scope" "group_names" {
  realm_id               = keycloak_realm.example.id
  name                   = "group_names"
  include_in_token_scope = true
}

resource "keycloak_openid_group_membership_protocol_mapper" "group_names" {
  realm_id   = keycloak_realm.example.id
  client_id  = keycloak_openid_client.example.id
  name       = keycloak_openid_client_scope.group_names.name
  claim_name = keycloak_openid_client_scope.group_names.name
}

resource "keycloak_openid_client_scope" "role_names" {
  realm_id               = keycloak_realm.example.id
  name                   = "role_names"
  include_in_token_scope = true
}

resource "keycloak_openid_user_realm_role_protocol_mapper" "role_names" {
  realm_id    = keycloak_realm.example.id
  client_id   = keycloak_openid_client.example.id
  name        = keycloak_openid_client_scope.role_names.name
  claim_name  = keycloak_openid_client_scope.role_names.name
  multivalued = true
}

resource "keycloak_openid_client_scope" "department" {
  realm_id               = keycloak_realm.example.id
  name                   = "department"
  include_in_token_scope = true
}

resource "keycloak_openid_user_attribute_protocol_mapper" "user_property_mapper" {
  realm_id            = keycloak_realm.example.id
  client_scope_id     = keycloak_openid_client_scope.department.id
  name                = keycloak_openid_client_scope.department.name
  user_attribute      = keycloak_openid_client_scope.department.name
  claim_name          = keycloak_openid_client_scope.department.name
  add_to_access_token = true
  add_to_id_token     = true
  add_to_userinfo     = true
}

resource "keycloak_openid_client_default_scopes" "example" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.department.name,
  ]
}
