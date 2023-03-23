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

resource "keycloak_openid_client_default_scopes" "example" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.example.id
  default_scopes = [
    "profile",
    "email",
  ]
}
