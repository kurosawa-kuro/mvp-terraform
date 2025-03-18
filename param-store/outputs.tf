output "parameter_arns" {
  description = "作成されたパラメータのARNのマップ"
  value       = { for k, v in aws_ssm_parameter.parameters : k => v.arn }
}

output "parameter_names" {
  description = "作成されたパラメータの名前のリスト"
  value       = [for p in aws_ssm_parameter.parameters : p.name]
} 