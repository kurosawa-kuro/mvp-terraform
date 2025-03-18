# AWS Parameter Store Terraform モジュール

このTerraformコードはAWS Systems Manager Parameter Storeのパラメータを管理するためのものです。

## 使用方法

1. `terraform.tfvars` ファイルを作成する（`terraform.tfvars.example`をコピーして利用できます）
```bash
cp terraform.tfvars.example terraform.tfvars
```

2. `terraform.tfvars` ファイルを編集して、必要なパラメータを設定する

3. Terraformを初期化して実行する
```bash
terraform init
terraform plan
terraform apply
```

## 入力変数

| 名前 | 説明 | タイプ | デフォルト |
|------|-------------|------|---------|
| aws_region | AWSリージョン | `string` | `"ap-northeast-1"` |
| parameters | 作成するパラメータのマップ | `map(any)` | `{}` |
| tags | すべてのリソースに付与するタグ | `map(string)` | `{}` |

### parameters変数の形式

```hcl
parameters = {
  "/パス/パラメータ名" = {
    value       = "パラメータの値"
    description = "説明（任意）"
    type        = "String/SecureString/StringList"（任意、デフォルトはString）
    tier        = "Standard/Advanced/IntelligentTiering"（任意、デフォルトはStandard）
    key_id      = "KMSキーID"（SecureStringの場合のみ、任意）
    tags        = { キー = "値" }（任意、パラメータ固有のタグ）
  }
}
```

## 出力変数

| 名前 | 説明 |
|------|-------------|
| parameter_arns | 作成されたパラメータのARNのマップ |
| parameter_names | 作成されたパラメータの名前のリスト | 