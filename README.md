# terraform-cloudflare-no-email

SPF, DKIM and DMARC records for zones which do not send email.

This creates a `cloudflare_record` resource for SPF, DKIM and DMARC of the given `zone_id`.

The SPF and DMARC policies are set to reject all and you must provide an email address for DMARC Aggregate and Failure reports, through the `dmarc_rua` and `dmarc_ruf` variables respectively.

## Usage

```terraform

resource "cloudflare_zone" "example_com" {
  zone = "example.com"
}

module {
  source = "rsclarke/no-email/cloudflare"

  zone_id   = cloudflare_zone.example_com.id
  dmarc_rua = ["dmarc_rua@example.net"]
  dmarc_ruf = ["dmarc_ruf@example.net", "dmarc_ruf@example.org"]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | `~> 0.14.0` |
| cloudflare | `>= 2.0` |

## Providers

| Name | Version |
|------|---------|
| cloudflare | `>= 2.0` |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| zone_id | Cloudflare Zone ID | `string` | yes |
| dmarc_rua | Email addresses for DMARC Aggregate reports (excluding `mailto:`), at least one and contains the `@` symbol. | `list(string)` | yes |
| dmarc_rua | Email addresses for DMARC Failure (or Forensic) reports (excluding `mailto:`), at least one and contains the `@` symbol. | `list(string)` | yes |

## Outputs

This module does not expose any ouputs.
