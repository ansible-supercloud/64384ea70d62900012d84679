
include "root" {
  path = find_in_parent_folders()
}



dependency "cluster" {
  config_path = "${get_parent_terragrunt_dir()}/105-azure-aro/terraform"
  skip_outputs = false

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "destroy", "output"]
  mock_outputs = {
    azure-aro_server_url = ""
    azure-aro_server_url = ""
    azure-aro_username = ""
    azure-aro_password = ""
    azure-aro_token = ""
  }
}


inputs = {
    server_url = dependency.cluster.outputs.azure-aro_server_url
    cluster_server_url = dependency.cluster.outputs.azure-aro_server_url
    cluster_login_user = dependency.cluster.outputs.azure-aro_username
    cluster_login_password = dependency.cluster.outputs.azure-aro_password
    cluster_login_token = dependency.cluster.outputs.azure-aro_token
}
