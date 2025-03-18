provider "aws" {
  region = var.aws_region
}

resource "aws_ssm_parameter" "parameters" {
  for_each = var.parameters

  name        = each.key
  description = lookup(each.value, "description", null)
  type        = lookup(each.value, "type", "String")
  value       = each.value.value
  tier        = lookup(each.value, "tier", "Standard")
  key_id      = lookup(each.value, "type", "String") == "SecureString" ? lookup(each.value, "key_id", "alias/aws/ssm") : null
  
  tags = merge(
    var.tags,
    lookup(each.value, "tags", {})
  )
} 