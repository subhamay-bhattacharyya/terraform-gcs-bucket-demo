# -- tf/outputs.tf (Root Module)
# ============================================================================
# Root Module Outputs
# ============================================================================

output "gcs_buckets" {
  description = "Attributes of all provisioned GCS buckets"
  value = {
    multi_regional_basic = {
      id            = module.gcs_multi_regional_basic.bucket_id
      name          = module.gcs_multi_regional_basic.bucket_name
      project       = module.gcs_multi_regional_basic.bucket_project
      location      = module.gcs_multi_regional_basic.bucket_location
      url           = module.gcs_multi_regional_basic.bucket_url
      self_link     = module.gcs_multi_regional_basic.bucket_self_link
      storage_class = module.gcs_multi_regional_basic.bucket_storage_class
      force_destroy = module.gcs_multi_regional_basic.bucket_force_destroy
    }
    regional_basic = {
      id            = module.gcs_regional_basic.bucket_id
      name          = module.gcs_regional_basic.bucket_name
      project       = module.gcs_regional_basic.bucket_project
      location      = module.gcs_regional_basic.bucket_location
      url           = module.gcs_regional_basic.bucket_url
      self_link     = module.gcs_regional_basic.bucket_self_link
      storage_class = module.gcs_regional_basic.bucket_storage_class
      force_destroy = module.gcs_regional_basic.bucket_force_destroy
    }
    dual_region_basic = {
      id            = module.gcs_dual_region_basic.bucket_id
      name          = module.gcs_dual_region_basic.bucket_name
      project       = module.gcs_dual_region_basic.bucket_project
      location      = module.gcs_dual_region_basic.bucket_location
      url           = module.gcs_dual_region_basic.bucket_url
      self_link     = module.gcs_dual_region_basic.bucket_self_link
      storage_class = module.gcs_dual_region_basic.bucket_storage_class
      force_destroy = module.gcs_dual_region_basic.bucket_force_destroy
    }
    # zonal_basic = {
    #   id            = module.gcs_zonal_basic.bucket_id
    #   name          = module.gcs_zonal_basic.bucket_name
    #   project       = module.gcs_zonal_basic.bucket_project
    #   location      = module.gcs_zonal_basic.bucket_location
    #   url           = module.gcs_zonal_basic.bucket_url
    #   self_link     = module.gcs_zonal_basic.bucket_self_link
    #   storage_class = module.gcs_zonal_basic.bucket_storage_class
    #   force_destroy = module.gcs_zonal_basic.bucket_force_destroy
    # }
    lifecycle_basic = {
      id            = module.gcs_lifecycle_basic.bucket_id
      name          = module.gcs_lifecycle_basic.bucket_name
      project       = module.gcs_lifecycle_basic.bucket_project
      location      = module.gcs_lifecycle_basic.bucket_location
      url           = module.gcs_lifecycle_basic.bucket_url
      self_link     = module.gcs_lifecycle_basic.bucket_self_link
      storage_class = module.gcs_lifecycle_basic.bucket_storage_class
      force_destroy = module.gcs_lifecycle_basic.bucket_force_destroy
    }
  }
}
