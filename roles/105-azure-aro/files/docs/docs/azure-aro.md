# Azure OpenShift ARO module

Module to provision Azure RedHat OpenShift on azure


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


None

### Module dependencies


- resource-group - [github.com/cloud-native-toolkit/terraform-azure-resource-group](https://github.com/cloud-native-toolkit/terraform-azure-resource-group) (>= 1.1.1)
- vnet - [github.com/cloud-native-toolkit/terraform-azure-vnet](https://github.com/cloud-native-toolkit/terraform-azure-vnet) (>= 1.1.3)
- master-subnet - [github.com/cloud-native-toolkit/terraform-azure-subnets](https://github.com/cloud-native-toolkit/terraform-azure-subnets) (>= 1.3.10)
- worker-subnet - [github.com/cloud-native-toolkit/terraform-azure-subnets](https://github.com/cloud-native-toolkit/terraform-azure-subnets) (>= 1.3.10)

## Example usage

```hcl
module "cluster" {
  source = "github.com/cloud-native-toolkit/terraform-azure-aro"

  client_secret = var.client_secret
  disable_public_endpoint = var.cluster_disable_public_endpoint
  encrypt = var.cluster_encrypt
  fips = var.cluster_fips
  key_vault_id = var.cluster_key_vault_id
  label = var.cluster_label
  master_flavor = var.cluster_master_flavor
  master_subnet_id = module.master-subnet.id
  name = var.cluster_name
  name_prefix = var.cluster_name_prefix
  os_type = var.cluster_os_type
  pod_cidr = var.cluster_pod_cidr
  provision = var.cluster_provision
  pull_secret = var.cluster_pull_secret
  pull_secret_file = var.cluster_pull_secret_file
  resource_group_name = module.resource_group.name
  service_cidr = var.cluster_service_cidr
  tags = var.cluster_tags
  vnet_name = module.vnet.name
  worker_count = var.cluster_worker_count
  worker_disk_size = var.cluster_worker_disk_size
  worker_flavor = var.cluster_worker_flavor
  worker_subnet_id = module.worker-subnet.id
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| resource_group_name | The name of the resource group where the cluster will be provisioned | true |  | resource-group.name |
| client_secret | The secret used to access the subscription | true |  |  |
| master_subnet_id | The id of the subnet where the master nodes will be placed | true |  | master-subnet.id |
| worker_subnet_id | The id of the subnet where the worker nodes will be placed | true |  | worker-subnet.id |
| vnet_name | The name of the VNet | true |  | vnet.name |
| master_flavor | The size of the VMs for the master nodes | false | Standard_D8s_v3 |  |
| worker_flavor | The size of the VMs for the worker nodes | false | Standard_D4s_v3 |  |
| worker_count | The number of compute worker nodes | false | 3 |  |
| os_type | The type of os for the master and worker nodes | false | Linux |  |
| provision | Flag indicating the cluster should be provisioned. If the value is false then an existing cluster will be looked up | false | true |  |
| name | The name of the ARO cluster. If empty the name will be derived from the name prefix | true |  |  |
| name_prefix | The prefix name for the service. If not provided it will default to the resource group name | true |  |  |
| disable_public_endpoint | Flag to make the cluster private only | true |  |  |
| worker_disk_size | The size in GB of the disk for each worker node | false | 128 |  |
| pull_secret | The contents of the pull secret needed to access Red Hat content. The contents can either be provided directly or passed through the `pull_secret_file` variable | true |  |  |
| pull_secret_file | Name of the file containing the pull secret needed to access Red Hat content. The contents can either be provided in this file or directly via the `pull_secret` variable | true |  |  |
| label | The label used to generate the cluster name | false | cluster |  |
| key_vault_id | THe Azure id of an existing key vault to use to store ARO Service Principal credentials (default = \"\") | true |  |  |
| encrypt | Flag to encrypt the VM disks (default = false) | true |  |  |
| pod_cidr | CIDR for the POD subnet (default = \"10.128.0.0/14\") | false | 10.128.0.0/14 |  |
| service_cidr | CIDR for the services subnet (default = \"172.30.0.0/16\") | false | 172.30.0.0/16 |  |
| fips | Flag to determine if FIPS validated modules should be utilized (default = false) | true |  |  |
| tags | List of tags to be included as \"name\":\"value\" pairs (default = {}) | false | {} |  |

### Outputs

| Name | Description |
|------|-------------|
| id | ID of the created cluster |
| name | Name of the cluster |
| resource_group_name | Name of the resource group containing the cluster. |
| region | Region containing the cluster. |
| config_file_path | Path to the config file for the cluster |
| token | Login token for the cluster |
| console_url | The URL for the web console of the cluster |
| username | Username for the cluster |
| password | Password for the cluster |
| serverURL | The URL used to connect to the API of the cluster |
| platform | Configuration values for the created cluster platform |
| sync | Value used to sync downstream modules |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (0.1.5)
