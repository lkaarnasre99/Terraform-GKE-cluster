variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
}

variable "zone" {
  description = "The zone to deploy to"
  type        = string
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the cluster"
  type        = number
 
}

variable "min_nodes" {
  description = "The minimum number of nodes in the cluster"
  type        = number
  
}

variable "max_nodes" {
  description = "The maximum number of nodes in the cluster"
  type        = number
  
}

variable "machine_type" {
  description = "The machine type to use for the nodes"
  type        = string
  
}