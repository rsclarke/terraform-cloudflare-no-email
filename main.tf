resource "cloudflare_record" "spf" {
  zone_id = var.zone_id
  name    = "@"
  value   = "v=spf1 -all"
  type    = "TXT"
}

resource "cloudflare_record" "dkim" {
  zone_id = var.zone_id
  name    = "*._domainkey"
  value   = "v=DKIM1; p="
  type    = "TXT"
}

resource "cloudflare_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc"
  value   = "v=DMARC1; p=reject; rua=mailto:${join(",mailto:", var.dmarc_rua)}; ruf=mailto:${join(",mailto:", var.dmarc_ruf)}; fo=1:d:s"
  type    = "TXT"
}
