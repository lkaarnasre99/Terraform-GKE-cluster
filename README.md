# Terraform-Kubernetes-cluster

terraform-gcp-kubernetes/
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
  └── README.md
root/
  └── main.tf
  └── terraform.tfvars


  # Terraform GCP Kubernetes Module

This module creates a Kubernetes cluster on Google Cloud Platform (GCP) with the following features:

- Zone: configurable
- Release channel: Regular
- Cluster version: 1.29 or newer
- Cluster autoscaler: Enabled
- Number of nodes: 3 (configurable)
- Minimum nodes: 2 (configurable)
- Maximum nodes: 6 (configurable)
- Machine type: e2-medium (configurable)

## Usage

```hcl
module "gcp_kubernetes" {
  source       = "../terraform-gcp-kubernetes"
  project_id   = "your-gcp-project-id"
  region       = "your-gcp-region"
  zone         = "your-gcp-zone"
  cluster_name = "your-cluster-name"
  node_count   = 3
  min_nodes    = 2
  max_nodes    = 6
  machine_type = "e2-medium"
}
```

## Inputs

| Name          | Description                          | Type   | Default     | Required |
|---------------|--------------------------------------|--------|-------------|----------|
| `project_id`  | The project ID to deploy to          | string | n/a         | yes      |
| `region`      | The region to deploy to              | string | n/a         | yes      |
| `zone`        | The zone to deploy to                | string | n/a         | yes      |
| `cluster_name`| The name of the Kubernetes cluster   | string | n/a         | yes      |
| `node_count`  | The number of nodes in the cluster   | number | 3           | yes      |
| `min_nodes`   | The minimum number of nodes in the cluster | number | 2           | yes      |
| `max_nodes`   | The maximum number of nodes in the cluster | number | 6           | yes      |
| `machine_type`| The machine type to use for the nodes| string | "e2-medium" | yes      |

## Outputs

| Name                          | Description                           |
|-------------------------------|---------------------------------------|
| `kubernetes_cluster_name`     | The name of the Kubernetes cluster    |
| `kubernetes_cluster_endpoint` | The endpoint of the Kubernetes cluster|
| `kubernetes_cluster_ca_certificate` | The CA certificate of the Kubernetes cluster |
| `kubernetes_cluster_username` | The username for accessing the Kubernetes cluster |
| `kubernetes_cluster_password` | The password for accessing the Kubernetes cluster |
