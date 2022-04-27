// Global
variable "resource_prefix" { type = string }

variable "resource_group_name" {  type = string }

variable "azure_location" { type = string }

variable "azure_subscription" { type = string }

variable "azure_tenant" { type = string }

variable "azure_object" { type = string }

// Backend
variable "strg_group_name" { type = string }

variable "strg_account_name" { type = string }

variable "strg_container_name" { type = string }

variable "strg_key_name" { type = string }

// VNETs y Subnets

variable "addr_vnets" { type = list(list(string)) }

variable "name_subnets" { type = list(string) }

variable "addr_subnets_01" { type = list(list(string)) }

variable "addr_subnets_02" { type = list(list(string)) }

// VM

variable "domain_dns_label" { type = string }

variable "interface_name_conf" { type = string }

variable "vm-username" { type = string }

variable "vm-size" { type = string }

variable "os_disk_conf" { type = list(string) }

variable "source_image_conf" { type = list(string) }