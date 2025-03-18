variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "parameters" {
  description = "作成するパラメータのマップ"
  type = map(object({
    value       = string
    description = optional(string)
    type        = optional(string, "String")
    tier        = optional(string, "Standard")
    key_id      = optional(string)
    tags        = optional(map(string), {})
  }))
  default = {}
}

variable "tags" {
  description = "すべてのリソースに付与するタグ"
  type        = map(string)
  default     = {}
} 