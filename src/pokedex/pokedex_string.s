.align 2
.thumb
.text
.global pdex_str_title
pdex_str_title:
    .string LAN_DE "Amitec Pokédex"
    .string LAN_EN "Amitec Pokédex"

.global pdex_str_seen
pdex_str_seen:
    .string LAN_DE "Ges.:"
    .string LAN_EN "Seen:"

.global pdex_str_caught
pdex_str_caught:
    .string LAN_DE "Gef.:"
    .string LAN_EN "Caught:"

.global pdex_str_size
pdex_str_size:
    .string LAN_DE "Größe:"
    .string LAN_EN "Size:"

.global pdex_str_weight
pdex_str_weight:
    .string LAN_DE "Gewicht:"
    .string LAN_EN "Weight:"

.global pdex_str_size_unit
pdex_str_size_unit:
    .string LAN_DE "m"
    .string LAN_EN "m"

.global pdex_str_weight_unit
pdex_str_weight_unit:
    .string LAN_DE "kg"
    .string LAN_EN "kg"

.global pdex_str_comma
pdex_str_comma:
    .string LAN_DE ","
    .string LAN_EN ","

.global pdex_str_empty
pdex_str_empty:
    .string LAN_DE "----------"
    .string LAN_EN "----------"

.global pdex_str_form_alola
pdex_str_form_alola:
    .string LAN_DE " (Alola)"
    .string LAN_DE " (Alola)"

.align 2
.global pdex_str_regions
pdex_str_regions:
.word pdex_str_empty
.word pdex_str_kanto
.word pdex_str_jotho
.word pdex_str_hoeen
.word pdex_str_sinnoh
.word pdex_str_unova
.word pdex_str_kalos
.word pdex_str_alola

pdex_str_kanto:
    .string LAN_DE "Kanto"
    .string LAN_EN "Kanto"

pdex_str_jotho:
    .string LAN_DE "Johto"
    .string LAN_EN "Johto"

pdex_str_hoeen:
    .string LAN_DE "Hoenn"
    .string LAN_EN "Hoenn"

pdex_str_sinnoh:
    .string LAN_DE "Sinnoh"
    .string LAN_EN "Sinnoh"

pdex_str_unova:
    .string LAN_DE "Einall"
    .string LAN_EN " Unova"

pdex_str_kalos:
    .string LAN_DE "Kalos"
    .string LAN_EN "Kalos"

pdex_str_alola:
    .string LAN_DE "Alola"
    .string LAN_EN "Alola"