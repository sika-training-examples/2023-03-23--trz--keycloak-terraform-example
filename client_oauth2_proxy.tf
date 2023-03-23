resource "keycloak_openid_client" "oauth2_proxy" {
  realm_id                        = keycloak_realm.example.id
  client_id                       = "oauth2_proxy"
  client_secret                   = "example"
  enabled                         = true
  standard_flow_enabled           = true
  access_type                     = "CONFIDENTIAL"
  valid_redirect_uris             = ["*"]
  valid_post_logout_redirect_uris = ["*"]
  web_origins                     = ["*"]
}

resource "keycloak_openid_client_scope" "groups" {
  realm_id               = keycloak_realm.example.id
  name                   = "groups"
  include_in_token_scope = true
}

resource "keycloak_openid_group_membership_protocol_mapper" "groups" {
  realm_id   = keycloak_realm.example.id
  client_id  = keycloak_openid_client.oauth2_proxy.id
  name       = keycloak_openid_client_scope.groups.name
  claim_name = keycloak_openid_client_scope.groups.name
}

resource "keycloak_openid_client_scope" "audience" {
  realm_id               = keycloak_realm.example.id
  name                   = "audience"
  include_in_token_scope = true
}

resource "keycloak_openid_audience_protocol_mapper" "audience" {
  realm_id                 = keycloak_realm.example.id
  client_id                = keycloak_openid_client.oauth2_proxy.id
  name                     = keycloak_openid_client_scope.audience.name
  included_client_audience = keycloak_openid_client.oauth2_proxy.client_id
}

resource "keycloak_openid_client_default_scopes" "oauth2_proxy" {
  realm_id  = keycloak_realm.example.id
  client_id = keycloak_openid_client.oauth2_proxy.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.groups.name,
    keycloak_openid_client_scope.audience.name,
  ]
}
