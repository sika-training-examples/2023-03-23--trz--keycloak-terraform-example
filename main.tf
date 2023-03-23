terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
    }
  }
}

provider "keycloak" {
  client_id = "admin-cli"
  url       = "http://localhost:8080"
  username  = "admin"
  password  = "admin"
}

resource "keycloak_realm" "example" {
  realm                  = "example"
  enabled                = true
  display_name           = "SSO"
  display_name_html      = "<h1 style=\"color: red; font-size: 2em\">SSO</h1>"
  reset_password_allowed = true
  remember_me            = true
  smtp_server {
    host                  = "mailhog"
    port                  = "1025"
    from                  = "sso@example.com"
    from_display_name     = "Example SSO"
    reply_to              = "support@example.com"
    reply_to_display_name = "Example Support"
    auth {
      username = "xxx"
      password = "xxx"
    }
  }
}

resource "keycloak_required_action" "otp" {
  realm_id       = keycloak_realm.example.id
  alias          = "CONFIGURE_TOTP"
  enabled        = true
  default_action = true
  name           = "Require TOTP"
}
