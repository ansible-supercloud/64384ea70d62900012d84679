# 105-azure-aro

Azure Vnet and ARO

## Running the automation

This terraform template is part of collection of layers that should be executed together. Before this layer
can be applied, several steps must first be taken:

1. Run `apply.sh` in the parent directory to generate the input variable configuration for the run. If you'd like to apply one layer at a time, select `n` when prompted to continue.
2. Run `apply.sh` for each of the layer dependencies listed below.
3. Run `apply.sh` for this layer.

## Contents

### Layer dependencies


No dependencies

### Modules

| Name | Description | Version |
|------|-------------|---------|
| [azure-resource-group](https://github.com/cloud-native-toolkit/terraform-azure-resource-group) | Module to provision a resource group on Azure | v1.1.1 |
| [azure-vnet](https://github.com/cloud-native-toolkit/terraform-azure-vnet) | Module to provision vnet on azure | v1.1.3 |
| [azure-vnet-subnets](https://github.com/cloud-native-toolkit/terraform-azure-subnets) | Module to provision vnet-subnets on azure | v1.3.10 |
| [azure-vnet-subnets](https://github.com/cloud-native-toolkit/terraform-azure-subnets) | Module to provision vnet-subnets on azure | v1.3.10 |
| [azure-aro](https://github.com/cloud-native-toolkit/terraform-azure-aro) | Module to provision Azure RedHat OpenShift on azure | v2.0.0 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| resource_group_name | The name of the resource group |  |  |
| region | The Azure location where the resource group will be provisioned |  |  |
| subscription_id |  |  |  |
| client_id |  |  |  |
| client_secret |  | true |  |
| tenant_id |  |  |  |
| name_prefix | The name of the vpc resource |  |  |
| pull_secret | The contents of the pull secret needed to access Red Hat content. The contents can either be provided directly or passed through the `pull_secret_file` variable |  |  |
| pull_secret_file | Name of the file containing the pull secret needed to access Red Hat content. The contents can either be provided in this file or directly via the `pull_secret` variable |  |  |

## Troubleshooting

