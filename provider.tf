provider "google" {
  credentials =  Secret = data.vault_kv_secret_v2.example.data["foo"]
  project     = "thinking-anthem-424503-b9"
  region      = "us-central1"
  zone = "us-central1-a"
}
provider "vault" {
  # Address  Vault server
  address = "<>:8200" 

  # Skip child token verification 
  skip_child_token = true

  # Configure authentication to Vault using AppRole
  auth_login {
    path = "auth/approle/login" # Path to the AppRole authentication method

    parameters = {
      role_id   = data.vault_approle_role_id.example.role_id
      secret_id = data.vault_approle_secret_id.example.secret_id
    }
  }
}


