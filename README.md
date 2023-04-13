# infra-azure-quickstart

Azure simple architecture to quickly get an OpenShift cluster provisioned, ideal for demos

![Diagram](diagram.png)

## Running the automation

There are three different options for how to configure and run the automation:

- Interactive prompts
- Yaml configuration
- Terraform configuration

### Interactive prompts

In this mode, you will be prompted interactively for the variables required to run the automation.

1. Run the `apply.sh` script
2. At each prompt, provide a value for the variable.
3. Once all the variables are collected, you will be asked to apply the automation. Enter `y` to continue or `n` to stop. Either way, the values provided have been collected and written to two sets of files so that next time you can skip the prompts.

The `apply.sh` script will generate credentials.yaml and variables.yaml input files that can be used
for future deployments as well as generating the credentials.auto.tfvars and terraform.tfvars files
used by the terraform. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Yaml configuration

In this mode, you provide the configuration for your instance in yaml configuration files and avoid
the prompts.

1. Copy the variables.template.yaml file to variables.yaml and credentials.template.yaml to credentials.yaml.
2. Provide values for each of the variables in variables.yaml and credentials.yaml.
3. Run `apply.sh --ci` to kick off the automation. You will not be prompted for input variables and the automation will start immediately

The `apply.sh` script will generate the credentials.auto.tfvars and terraform.tfvars files from the
values provided in the yaml files. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Terraform configuration

In situations where you are comfortable working with the terraform directly, you can skip the yaml
configuration files and directly configure the automation with the terraform configuration files.

1. Copy the variables.template.tfvars file and credentials.auto.template.tfvars to variables.tfvars and credentials.auto.tfvars, respectively.
2. Provide values for the different variables in variables.tfvars and credentials.auto.tfvars.
3. Kick off the automation with `apply.sh --ci` or skip the script and run `terragrunt run-all apply --terragrunt-parallelism 1 --terragrunt-non-interactive`

The terraform.tfvars file can be checked in with the terraform templates. However, credentials.auto.tfvars
should be excluded since it contains sensitive information. The credentials.auto.tfvars file should
already be in .gitignore.

## Contents

### Layers

| Name | Layer | Description | Version |
|------|-------|-------------|---------|
| [105-azure-aro](./105-azure-aro) | infrastructure | Azure Vnet and ARO | v1.0.1 |
| [200-openshift-gitops](./200-openshift-gitops) | software | Provisions OpenShift GitOps (ArgoCD) into an existing cluster and bootstraps it to a gitops repository | v1.0.1 |
| [220-dev-tools](./220-dev-tools) | software | Provisions development tools in an OpenShift cluster | v1.0.0 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| client_id |  |  |  |
| client_secret |  | true |  |
| config_banner_text | The text that will appear in the top banner in the cluster |  |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |
| region | The Azure location where the resource group will be provisioned |  |  |
| resource_group_name | The name of the resource group |  |  |
| subscription_id |  |  |  |
| tenant_id |  |  |  |
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |
| name_prefix | The name of the vpc resource |  |  |
| pull_secret | The contents of the pull secret needed to access Red Hat content. The contents can either be provided directly or passed through the `pull_secret_file` variable |  |  |
| pull_secret_file | Name of the file containing the pull secret needed to access Red Hat content. The contents can either be provided in this file or directly via the `pull_secret` variable |  |  |

## Troubleshooting

