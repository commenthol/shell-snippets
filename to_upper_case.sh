
#----
# upper case transliteration for ascii chars only
ascii_to_upper_case () {
	tr "[a-z]" "[A-Z]"
}

#----
# upper case transliteration for latin 1 UTF-8
to_upper_case () {
    sed 's/a/A/g;s/b/B/g;s/c/C/g;s/d/D/g;s/e/E/g;s/f/F/g;s/g/G/g;s/h/H/g;s/i/I/g;s/j/J/g;s/k/K/g;s/l/L/g;s/m/M/g;s/n/N/g;s/o/O/g;s/p/P/g;s/q/Q/g;s/r/R/g;s/s/S/g;s/t/T/g;s/u/U/g;s/v/V/g;s/w/W/g;s/x/X/g;s/y/Y/g;s/z/Z/g;s/µ/Μ/g;s/à/À/g;s/á/Á/g;s/â/Â/g;s/ã/Ã/g;s/ä/Ä/g;s/å/Å/g;s/æ/Æ/g;s/ç/Ç/g;s/è/È/g;s/é/É/g;s/ê/Ê/g;s/ë/Ë/g;s/ì/Ì/g;s/í/Í/g;s/î/Î/g;s/ï/Ï/g;s/ð/Ð/g;s/ñ/Ñ/g;s/ò/Ò/g;s/ó/Ó/g;s/ô/Ô/g;s/õ/Õ/g;s/ö/Ö/g;s/ø/Ø/g;s/ù/Ù/g;s/ú/Ú/g;s/û/Û/g;s/ü/Ü/g;s/ý/Ý/g;s/þ/Þ/g;s/ß/SS/g;s/ÿ/Ÿ/g;s/ā/Ā/g;s/ă/Ă/g;s/ą/Ą/g;s/ć/Ć/g;s/ĉ/Ĉ/g;s/ċ/Ċ/g;s/č/Č/g;s/ď/Ď/g;s/đ/Đ/g;s/ē/Ē/g;s/ĕ/Ĕ/g;s/ė/Ė/g;s/ę/Ę/g;s/ě/Ě/g;s/ĝ/Ĝ/g;s/ğ/Ğ/g;s/ġ/Ġ/g;s/ģ/Ģ/g;s/ĥ/Ĥ/g;s/ħ/Ħ/g;s/ĩ/Ĩ/g;s/ī/Ī/g;s/ĭ/Ĭ/g;s/į/Į/g;s/i̇/İ/g;s/ĳ/Ĳ/g;s/ĵ/Ĵ/g;s/ķ/Ķ/g;s/ĺ/Ĺ/g;s/ļ/Ļ/g;s/ľ/Ľ/g;s/ŀ/Ŀ/g;s/ł/Ł/g;s/ń/Ń/g;s/ņ/Ņ/g;s/ň/Ň/g;s/ŉ/ʼN/g;s/ŋ/Ŋ/g;s/ō/Ō/g;s/ŏ/Ŏ/g;s/ő/Ő/g;s/œ/Œ/g;s/ŕ/Ŕ/g;s/ŗ/Ŗ/g;s/ř/Ř/g;s/ś/Ś/g;s/ŝ/Ŝ/g;s/ş/Ş/g;s/š/Š/g;s/ţ/Ţ/g;s/ť/Ť/g;s/ŧ/Ŧ/g;s/ũ/Ũ/g;s/ū/Ū/g;s/ŭ/Ŭ/g;s/ů/Ů/g;s/ű/Ű/g;s/ų/Ų/g;s/ŵ/Ŵ/g;s/ŷ/Ŷ/g;s/ź/Ź/g;s/ż/Ż/g;s/ž/Ž/g;s/ƀ/Ƀ/g;s/ɓ/Ɓ/g;s/ƃ/Ƃ/g;s/ƅ/Ƅ/g;s/ɔ/Ɔ/g;s/ƈ/Ƈ/g;s/ɖ/Ɖ/g;s/ɗ/Ɗ/g;s/ƌ/Ƌ/g;s/ǝ/Ǝ/g;s/ə/Ə/g;s/ɛ/Ɛ/g;s/ƒ/Ƒ/g;s/ɠ/Ɠ/g;s/ɣ/Ɣ/g;s/ƕ/Ƕ/g;s/ɩ/Ɩ/g;s/ɨ/Ɨ/g;s/ƙ/Ƙ/g;s/ƚ/Ƚ/g;s/ɯ/Ɯ/g;s/ɲ/Ɲ/g;s/ƞ/Ƞ/g;s/ɵ/Ɵ/g;s/ơ/Ơ/g;s/ƣ/Ƣ/g;s/ƥ/Ƥ/g;s/ʀ/Ʀ/g;s/ƨ/Ƨ/g;s/ʃ/Ʃ/g;s/ƭ/Ƭ/g;s/ʈ/Ʈ/g;s/ư/Ư/g;s/ʊ/Ʊ/g;s/ʋ/Ʋ/g;s/ƴ/Ƴ/g;s/ƶ/Ƶ/g;s/ʒ/Ʒ/g;s/ƹ/Ƹ/g;s/ƽ/Ƽ/g;s/ƿ/Ƿ/g;s/ǆ/Ǆ/g;s/ǉ/Ǉ/g;s/ǌ/Ǌ/g;s/ǎ/Ǎ/g;s/ǐ/Ǐ/g;s/ǒ/Ǒ/g;s/ǔ/Ǔ/g;s/ǖ/Ǖ/g;s/ǘ/Ǘ/g;s/ǚ/Ǚ/g;s/ǜ/Ǜ/g;s/ǟ/Ǟ/g;s/ǡ/Ǡ/g;s/ǣ/Ǣ/g;s/ǥ/Ǥ/g;s/ǧ/Ǧ/g;s/ǩ/Ǩ/g;s/ǫ/Ǫ/g;s/ǭ/Ǭ/g;s/ǯ/Ǯ/g;s/ǰ/J̌/g;s/ǳ/Ǳ/g;s/ǵ/Ǵ/g;s/ǹ/Ǹ/g;s/ǻ/Ǻ/g;s/ǽ/Ǽ/g;s/ǿ/Ǿ/g;s/ȁ/Ȁ/g;s/ȃ/Ȃ/g;s/ȅ/Ȅ/g;s/ȇ/Ȇ/g;s/ȉ/Ȉ/g;s/ȋ/Ȋ/g;s/ȍ/Ȍ/g;s/ȏ/Ȏ/g;s/ȑ/Ȑ/g;s/ȓ/Ȓ/g;s/ȕ/Ȕ/g;s/ȗ/Ȗ/g;s/ș/Ș/g;s/ț/Ț/g;s/ȝ/Ȝ/g;s/ȟ/Ȟ/g;s/ȣ/Ȣ/g;s/ȥ/Ȥ/g;s/ȧ/Ȧ/g;s/ȩ/Ȩ/g;s/ȫ/Ȫ/g;s/ȭ/Ȭ/g;s/ȯ/Ȯ/g;s/ȱ/Ȱ/g;s/ȳ/Ȳ/g;s/ⱥ/Ⱥ/g;s/ȼ/Ȼ/g;s/ⱦ/Ⱦ/g;s/ȿ/Ȿ/g;s/ɀ/Ɀ/g;s/ɂ/Ɂ/g;s/ʉ/Ʉ/g;s/ʌ/Ʌ/g;s/ɇ/Ɇ/g;s/ɉ/Ɉ/g;s/ɋ/Ɋ/g;s/ɍ/Ɍ/g;s/ɏ/Ɏ/g;'
  }
