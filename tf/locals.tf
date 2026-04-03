# -- tf/locals.tf

locals {

  # ---------------------------------------------------------------------------
  # Environment abbreviation map
  # ---------------------------------------------------------------------------

  _env_map = {
    devl = "devl"
    test = "test"
    prod = "prod"
  }

  # ---------------------------------------------------------------------------
  # Common labels merged into every bucket's label set
  # ---------------------------------------------------------------------------

  _common_labels = {
    environment = var.environment
    project     = var.project_code
    managed_by  = "terraform"
  }

  # ---------------------------------------------------------------------------
  # Named locals per config key — labels merged with common labels
  # ---------------------------------------------------------------------------
  _raw_basic_multi_regional_bucket_config = jsondecode(file("${path.module}/../input-jsons/${var.environment}/${var.gcs_config_path.basic}"))

  gcs_bucket_multi_region_basic = {
    base_name     = local._raw_basic_multi_regional_bucket_config.base_name
    location      = try(local._raw_basic_multi_regional_bucket_config.location, "US")
    storage_class = try(local._raw_basic_multi_regional_bucket_config.storage_class, "STANDARD")
    force_destroy = try(local._raw_basic_multi_regional_bucket_config.force_destroy, false)
    labels = merge(
      try(local._raw_basic_multi_regional_bucket_config.labels, {}),
      local._common_labels
    )
  }

  _raw_basic_regional_bucket_config = jsondecode(file("${path.module}/../input-jsons/${var.environment}/${var.gcs_config_path.regional}"))

  gcs_bucket_region_basic = {
    base_name     = local._raw_basic_regional_bucket_config.base_name
    location      = try(local._raw_basic_regional_bucket_config.location, "US-EAST1")
    storage_class = try(local._raw_basic_regional_bucket_config.storage_class, "STANDARD")
    force_destroy = try(local._raw_basic_regional_bucket_config.force_destroy, false)
    labels = merge(
      try(local._raw_basic_regional_bucket_config.labels, {}),
      local._common_labels
    )
  }

  _raw_basic_dual_region_bucket_config = jsondecode(file("${path.module}/../input-jsons/${var.environment}/${var.gcs_config_path.dual_region}"))

  gcs_dual_region_bucket_basic = {
    base_name     = local._raw_basic_dual_region_bucket_config.base_name
    location      = try(local._raw_basic_dual_region_bucket_config.location, "NAM4")
    storage_class = try(local._raw_basic_dual_region_bucket_config.storage_class, "MULTI_REGIONAL")
    force_destroy = try(local._raw_basic_dual_region_bucket_config.force_destroy, false)
    labels = merge(
      try(local._raw_basic_dual_region_bucket_config.labels, {}),
      local._common_labels
    )
  }

  _raw_basic_zonal_bucket_config = jsondecode(file("${path.module}/../input-jsons/${var.environment}/${var.gcs_config_path.zonal}"))

  gcs_zonal_bucket_basic = {
    base_name     = local._raw_basic_zonal_bucket_config.base_name
    location      = try(local._raw_basic_zonal_bucket_config.location, "US-EAST1")
    storage_class = try(local._raw_basic_zonal_bucket_config.storage_class, "STANDARD")
    force_destroy = try(local._raw_basic_zonal_bucket_config.force_destroy, false)
    labels = merge(
      try(local._raw_basic_zonal_bucket_config.labels, {}),
      local._common_labels
    )
  }

  _raw_lifecycle_bucket_config = jsondecode(file("${path.module}/../input-jsons/${var.environment}/${var.gcs_config_path.lifecycle}"))

  gcs_lifecycle_bucket_basic = {
    base_name      = local._raw_lifecycle_bucket_config.base_name
    location       = try(local._raw_lifecycle_bucket_config.location, "US-EAST1")
    storage_class  = try(local._raw_lifecycle_bucket_config.storage_class, "STANDARD")
    force_destroy  = try(local._raw_lifecycle_bucket_config.force_destroy, false)
    versioning     = try(local._raw_lifecycle_bucket_config.versioning, { enabled = false })
    lifecycle_rule = try(local._raw_lifecycle_bucket_config.lifecycle_rule, [])
    labels = merge(
      try(local._raw_lifecycle_bucket_config.labels, {}),
      local._common_labels
    )
  }

}
