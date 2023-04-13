## client_id: the value of client_id
client_id=""

## config_banner_text: The text that will appear in the top banner in the cluster
config_banner_text=""

## gitops_repo_repo: The short name of the repository (i.e. the part after the org/group name)
gitops_repo_repo=""

## region: The Azure location where the resource group will be provisioned
region=""

## resource_group_name: The name of the resource group
resource_group_name=""

## subscription_id: the value of subscription_id
subscription_id=""

## tenant_id: the value of tenant_id
tenant_id=""

## gitops_repo_host: The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used.
gitops_repo_host=""

## gitops_repo_org: The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used.
gitops_repo_org=""

## gitops_repo_project: The project that will be used for the git repo. (Primarily used for Azure DevOps repos)
gitops_repo_project=""

## gitops_repo_username: The username of the user with access to the repository
gitops_repo_username=""

## name_prefix: The name of the vpc resource
name_prefix=""

## pull_secret: The contents of the pull secret needed to access Red Hat content. The contents can either be provided directly or passed through the `pull_secret_file` variable
pull_secret=""

## pull_secret_file: Name of the file containing the pull secret needed to access Red Hat content. The contents can either be provided in this file or directly via the `pull_secret` variable
pull_secret_file=""

