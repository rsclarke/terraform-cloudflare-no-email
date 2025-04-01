resource "cloudflare_dns_record" "spf" {
  zone_id = var.zone_id
  name    = "@"
  content = "v=spf1 -all"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_dns_record" "dkim" {
  zone_id = var.zone_id
  name    = "*._domainkey"
  content = "v=DKIM1; p="
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_dns_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc"
  content = "v=DMARC1; p=reject; rua=mailto:${join(",mailto:", var.dmarc_rua)}; ruf=mailto:${join(",mailto:", var.dmarc_ruf)}; fo=1:d:s"
  type    = "TXT"
  ttl     = 1
}
