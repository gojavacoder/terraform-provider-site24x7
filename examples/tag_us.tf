terraform {
  # Require Terraform version 0.15.x (recommended)
  required_version = "~> 0.13.0"

  required_providers {
    site24x7 = {
      source  = "site24x7/site24x7"
      # Update the latest version from https://registry.terraform.io/providers/site24x7/site24x7/latest 
      version = "0.0.1-beta.5"
    }
  }
}

// Authentication API doc - https://www.site24x7.com/help/api/#authentication
provider "site24x7" {
  // The client ID will be looked up in the SITE24X7_OAUTH2_CLIENT_ID
  // environment variable if the attribute is empty or omitted.
  oauth2_client_id = "<SITE24X7_OAUTH2_CLIENT_ID>"

  // The client secret will be looked up in the SITE24X7_OAUTH2_CLIENT_SECRET
  // environment variable if the attribute is empty or omitted.
  oauth2_client_secret = "<SITE24X7_OAUTH2_CLIENT_SECRET>"

  // The refresh token will be looked up in the SITE24X7_OAUTH2_REFRESH_TOKEN
  // environment variable if the attribute is empty or omitted.
  oauth2_refresh_token = "<SITE24X7_OAUTH2_REFRESH_TOKEN>"

  // Specify the data center from which you have obtained your
  // OAuth client credentials and refresh token. It can be (US/EU/IN/AU/CN).
  data_center = "US"

  // The minimum time to wait in seconds before retrying failed Site24x7 API requests.
  retry_min_wait = 1

  // The maximum time to wait in seconds before retrying failed Site24x7 API
  // requests. This is the upper limit for the wait duration with exponential
  // backoff.
  retry_max_wait = 30

  // Maximum number of Site24x7 API request retries to perform until giving up.
  max_retries = 4

}

// Site24x7 Tag API doc - https://www.site24x7.com/help/api/#tags
resource "site24x7_tag" "tag_us" {
  // (Required) Display Name for the Tag.
  tag_name = "Website"

  // (Required) Value for the Tag.
  tag_value = "Zoho websites"

  // Color code for the Tag. Possible values are '#B7DA9E','#73C7A3','#B5DCDF','#D4ABBB','#4895A8','#DFE897','#FCEA8B','#FFC36D','#F79953','#F16B3C','#E55445','#F2E2B6','#DEC57B','#CBBD80','#AAB3D4','#7085BA','#F6BDAE','#EFAB6D','#CA765C','#999','#4A148C','#009688','#00ACC1','#0091EA','#8BC34A','#558B2F'
  tag_color = "#B7DA9E"

}