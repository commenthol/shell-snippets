
#----
# lower case transliteration for ascii chars only
# `tr` not available on photon
ascii_to_lower_case () {
	tr "[A-Z]" "[a-z]"
}

#----
# lower case transliteration for latin 1 UTF-8
to_lower_case () {
	sed 's/A/a/g;s/B/b/g;s/C/c/g;s/D/d/g;s/E/e/g;s/F/f/g;s/G/g/g;s/H/h/g;s/I/i/g;s/J/j/g;s/K/k/g;s/L/l/g;s/M/m/g;s/N/n/g;s/O/o/g;s/P/p/g;s/Q/q/g;s/R/r/g;s/S/s/g;s/T/t/g;s/U/u/g;s/V/v/g;s/W/w/g;s/X/x/g;s/Y/y/g;s/Z/z/g;s/Μ/µ/g;s/À/à/g;s/Á/á/g;s/Â/â/g;s/Ã/ã/g;s/Ä/ä/g;s/Å/å/g;s/Æ/æ/g;s/Ç/ç/g;s/È/è/g;s/É/é/g;s/Ê/ê/g;s/Ë/ë/g;s/Ì/ì/g;s/Í/í/g;s/Î/î/g;s/Ï/ï/g;s/Ð/ð/g;s/Ñ/ñ/g;s/Ò/ò/g;s/Ó/ó/g;s/Ô/ô/g;s/Õ/õ/g;s/Ö/ö/g;s/Ø/ø/g;s/Ù/ù/g;s/Ú/ú/g;s/Û/û/g;s/Ü/ü/g;s/Ý/ý/g;s/Þ/þ/g;s/SS/ß/g;s/Ÿ/ÿ/g;s/Ā/ā/g;s/Ă/ă/g;s/Ą/ą/g;s/Ć/ć/g;s/Ĉ/ĉ/g;s/Ċ/ċ/g;s/Č/č/g;s/Ď/ď/g;s/Đ/đ/g;s/Ē/ē/g;s/Ĕ/ĕ/g;s/Ė/ė/g;s/Ę/ę/g;s/Ě/ě/g;s/Ĝ/ĝ/g;s/Ğ/ğ/g;s/Ġ/ġ/g;s/Ģ/ģ/g;s/Ĥ/ĥ/g;s/Ħ/ħ/g;s/Ĩ/ĩ/g;s/Ī/ī/g;s/Ĭ/ĭ/g;s/Į/į/g;s/İ/i̇/g;s/Ĳ/ĳ/g;s/Ĵ/ĵ/g;s/Ķ/ķ/g;s/Ĺ/ĺ/g;s/Ļ/ļ/g;s/Ľ/ľ/g;s/Ŀ/ŀ/g;s/Ł/ł/g;s/Ń/ń/g;s/Ņ/ņ/g;s/Ň/ň/g;s/ʼN/ŉ/g;s/Ŋ/ŋ/g;s/Ō/ō/g;s/Ŏ/ŏ/g;s/Ő/ő/g;s/Œ/œ/g;s/Ŕ/ŕ/g;s/Ŗ/ŗ/g;s/Ř/ř/g;s/Ś/ś/g;s/Ŝ/ŝ/g;s/Ş/ş/g;s/Š/š/g;s/Ţ/ţ/g;s/Ť/ť/g;s/Ŧ/ŧ/g;s/Ũ/ũ/g;s/Ū/ū/g;s/Ŭ/ŭ/g;s/Ů/ů/g;s/Ű/ű/g;s/Ų/ų/g;s/Ŵ/ŵ/g;s/Ŷ/ŷ/g;s/Ź/ź/g;s/Ż/ż/g;s/Ž/ž/g;s/Ƀ/ƀ/g;s/Ɓ/ɓ/g;s/Ƃ/ƃ/g;s/Ƅ/ƅ/g;s/Ɔ/ɔ/g;s/Ƈ/ƈ/g;s/Ɖ/ɖ/g;s/Ɗ/ɗ/g;s/Ƌ/ƌ/g;s/Ǝ/ǝ/g;s/Ə/ə/g;s/Ɛ/ɛ/g;s/Ƒ/ƒ/g;s/Ɠ/ɠ/g;s/Ɣ/ɣ/g;s/Ƕ/ƕ/g;s/Ɩ/ɩ/g;s/Ɨ/ɨ/g;s/Ƙ/ƙ/g;s/Ƚ/ƚ/g;s/Ɯ/ɯ/g;s/Ɲ/ɲ/g;s/Ƞ/ƞ/g;s/Ɵ/ɵ/g;s/Ơ/ơ/g;s/Ƣ/ƣ/g;s/Ƥ/ƥ/g;s/Ʀ/ʀ/g;s/Ƨ/ƨ/g;s/Ʃ/ʃ/g;s/Ƭ/ƭ/g;s/Ʈ/ʈ/g;s/Ư/ư/g;s/Ʊ/ʊ/g;s/Ʋ/ʋ/g;s/Ƴ/ƴ/g;s/Ƶ/ƶ/g;s/Ʒ/ʒ/g;s/Ƹ/ƹ/g;s/Ƽ/ƽ/g;s/Ƿ/ƿ/g;s/Ǆ/ǆ/g;s/Ǉ/ǉ/g;s/Ǌ/ǌ/g;s/Ǎ/ǎ/g;s/Ǐ/ǐ/g;s/Ǒ/ǒ/g;s/Ǔ/ǔ/g;s/Ǖ/ǖ/g;s/Ǘ/ǘ/g;s/Ǚ/ǚ/g;s/Ǜ/ǜ/g;s/Ǟ/ǟ/g;s/Ǡ/ǡ/g;s/Ǣ/ǣ/g;s/Ǥ/ǥ/g;s/Ǧ/ǧ/g;s/Ǩ/ǩ/g;s/Ǫ/ǫ/g;s/Ǭ/ǭ/g;s/Ǯ/ǯ/g;s/J̌/ǰ/g;s/Ǳ/ǳ/g;s/Ǵ/ǵ/g;s/Ǹ/ǹ/g;s/Ǻ/ǻ/g;s/Ǽ/ǽ/g;s/Ǿ/ǿ/g;s/Ȁ/ȁ/g;s/Ȃ/ȃ/g;s/Ȅ/ȅ/g;s/Ȇ/ȇ/g;s/Ȉ/ȉ/g;s/Ȋ/ȋ/g;s/Ȍ/ȍ/g;s/Ȏ/ȏ/g;s/Ȑ/ȑ/g;s/Ȓ/ȓ/g;s/Ȕ/ȕ/g;s/Ȗ/ȗ/g;s/Ș/ș/g;s/Ț/ț/g;s/Ȝ/ȝ/g;s/Ȟ/ȟ/g;s/Ȣ/ȣ/g;s/Ȥ/ȥ/g;s/Ȧ/ȧ/g;s/Ȩ/ȩ/g;s/Ȫ/ȫ/g;s/Ȭ/ȭ/g;s/Ȯ/ȯ/g;s/Ȱ/ȱ/g;s/Ȳ/ȳ/g;s/Ⱥ/ⱥ/g;s/Ȼ/ȼ/g;s/Ⱦ/ⱦ/g;s/Ȿ/ȿ/g;s/Ɀ/ɀ/g;s/Ɂ/ɂ/g;s/Ʉ/ʉ/g;s/Ʌ/ʌ/g;s/Ɇ/ɇ/g;s/Ɉ/ɉ/g;s/Ɋ/ɋ/g;s/Ɍ/ɍ/g;s/Ɏ/ɏ/g;'
}
