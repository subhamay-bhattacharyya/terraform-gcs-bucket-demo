# -- tf/main.tf (Root Module)
# ============================================================================
# Root Module — GCS Bucket Module Invocation
# ============================================================================

# ----------------------------------------------------------------------------
# Terraform configuration invoking the terraform-google-gcs-bucket module from GitHub
# ----------------------------------------------------------------------------
module "gcs_multi_regional_basic" {
  source = "github.com/subhamay-bhattacharyya-tf/terraform-google-gcs-bucket?ref=feature/TFMOD-0001-initial-module-scaffold-f"

  environment  = local._env_map[var.environment]
  project_id   = var.project_id
  project_code = var.project_code
  gcs_config   = local.gcs_bucket_multi_region_basic
}

module "gcs_regional_basic" {
  source = "github.com/subhamay-bhattacharyya-tf/terraform-google-gcs-bucket?ref=feature/TFMOD-0001-initial-module-scaffold-f"

  environment  = local._env_map[var.environment]
  project_id   = var.project_id
  project_code = var.project_code
  gcs_config   = local.gcs_bucket_region_basic
}

module "gcs_dual_region_basic" {
  source = "github.com/subhamay-bhattacharyya-tf/terraform-google-gcs-bucket?ref=feature/TFMOD-0001-initial-module-scaffold-f"

  environment  = local._env_map[var.environment]
  project_id   = var.project_id
  project_code = var.project_code
  gcs_config   = local.gcs_dual_region_bucket_basic
}

# module "gcs_zonal_basic" {
#   source = "github.com/subhamay-bhattacharyya-tf/terraform-google-gcs-bucket?ref=feature/TFMOD-0001-initial-module-scaffold-f"
#
#   environment  = local._env_map[var.environment]
#   project_id   = var.project_id
#   project_code = var.project_code
#   gcs_config   = local.gcs_zonal_bucket_basic
# }

module "gcs_lifecycle_basic" {
  source = "github.com/subhamay-bhattacharyya-tf/terraform-google-gcs-bucket?ref=feature/TFMOD-0001-initial-module-scaffold-f"

  environment  = local._env_map[var.environment]
  project_id   = var.project_id
  project_code = var.project_code
  gcs_config   = local.gcs_lifecycle_bucket_basic
}
