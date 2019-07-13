lcars2357 <- data.frame(
  series = 2357L,
  name = c("pale-canary", "neon-carrot", "tanoi", "golden-tanoi", "lilac", "eggplant", "anakiwa", "mariner", "bahama-blue"),
  value = c("#ffff99", "#ff9933", "#ffcc99", "#ffcc66", "#cc99cc", "#664466", "#99ccff", "#3366cc", "#006699"),
  stringsAsFactors = FALSE
)

lcars2369 <- data.frame(
  series = 2369L,
  name = c("blue-bell", "melrose", "lilac", "hopbush", "chestnut-rose", "orange-peel", "atomic-tangerine", "pale-canary"),
  value = c("#9999cc", "#9999ff", "#cc99cc", "#cc6699", "#cc6666", "#ff9966", "#ff9900", "#ffff99"),
  stringsAsFactors = FALSE
)

lcars2375 <- data.frame(
  series = 2375L,
  name = c("danub", "indigo", "lavender-purple", "cosmic", "red-damask", "medium-carmine", "bourbon", "sandy-brown"),
  value = c("#6688cc", "#4455bb","#9977aa", "#774466", "#dd6644", "#aa5533", "#bb6622", "#ee9955"),
  stringsAsFactors = FALSE
)

lcars2379 <- data.frame(
  series = 2379L,
  name = c("periwinkle", "dodger-pale", "dodger-soft", "near-blue", "navy-blue", "husk", "rust", "tamarillo"),
  value = c("#ccddff", "#5599ff", "#3366ff", "#0011ee", "#000088", "#bbaa55", "#bb4411", "#882211"),
  stringsAsFactors = FALSE
)

trekpals <- list(
  andorian = colorRampPalette(c("#FFFFFF", "#BBDEFA", "#64B5F6", "#2196F3", "#1675D3"))(9),
  andorian2 = colorRampPalette(c("#202020", "#446D99", "#83BDD7", "#E4E4E4"))(9),
  bajoran = c("#C00000", "#7A6424", "#323C34", "#4838A8", "#E6D56E", "#A8B5A9"),
  bajoran2 = c("#4A2420", "#4838A7", "#83889D", "#C73627", "#BBCDEE"),
  borg = colorRampPalette(c("#253741", "#5C849B", "#9EB3BA", "#FFFFFF", "#E8D159", "#A68528", "#604E20"))(9),
  borg2 = colorRampPalette(c("#FF0000", "#000000"))(9),
  breen = c("#56483D", "#332822", "#DFCDB9", "#996601", "#8BC95A", "#6C696F", "#F1E899", "#EE711E"),
  breen2 = colorRampPalette(c("#7E0500", "#CE1800", "#EF6F00", "#F7BD00", "#FFFFFF"))(9),
  cardassian = c("#66FFFF", "#78585C", "#2F7270", "#47110A", "#FFE705"),
  cardassian2 = c("#A6B9E4", "#2E7BC5", "#000000"),
  cardassian3 = c("#8BEAFF", "#BFCAFE", "#13A4EB", "#8B799C", "#DFE44A", "#000000"),
  cardassian4 = c("#A1B3E2", "#BB6754", "#646E49", "#944D40", "#DCE24B", "#4D341A", "#000000"),
  cardassian5 = c("#3C999C", "#524559", "#E0E74E", "#806F87", "#000000"),
  cardassian6 = c("#3DFFDC", "#CD8B83", "#E1E44D", "#FFFFFF", "#000000"),
  cardassian7 = c("#C86C18", "#F9AB3C", "#000000"),
  cardassian8 = c("#FFF7A3", "#D78017", "#945B29", "#7A4B42", "#512D16", "#3C271B", "#000000"),
  cardassian9 = c("#DEAF83", "#9B5928", "#E2ED50", "#CA480D"),
  cardassian10 = c("#646E49", "#B46356", "#DFE349", "#8D4939", "#000000"),
  dominion = c("#313131", "#255268", "#620062", "#63A542", "#A5C6D6", "#B5D6A5", "#B900B9"),
  enara = colorRampPalette(c("#4D004D", "#800080", "#F46404", "#E7D057", "#E9E09C"))(9),
  enara2 = c("#262626", "#3D5983", "#5A8A54", "#CFB023"),
  ferengi = colorRampPalette(c("#FFFFFF", "#C86B32"))(9),
  ferengi2 = colorRampPalette(c("#FFFFFF", "#00740E"))(9),
  ferengi3 = colorRampPalette(c("#00740E", "#FFFFFF", "#C86B32"))(9),
  gorn = c("#000042", "#0000B5", "#145416", "#639863", "#BDF7C6", "#FF0000", "#4E0000", "#A09349", "#777384"),
  iconian = colorRampPalette(c("#633210", "#B85C1D", "#FFFFFF", "#6B666C"))(9),
  kc_alliance = c("#A53942", "#294252", "#C6424A", "#527B94", "#000000"),
  klingon = rev(colorRampPalette(c("#000000", "#330000", "#660000", "#990000", "#CA0000", "#CA6400", "#C99400", "#FFFA0C", "#EEEBC4"))(9)),
  klingon2 = colorRampPalette(c("#FFFFFF", "#FF0000", "#000000"))(9),
  lcarscolors = unique(c(lcars2357$value, lcars2369$value, lcars2375$value, lcars2379$value)),
  lcars2357 = lcars2357$value,
  lcars2369 = lcars2369$value,
  lcars2375 = lcars2375$value,
  lcars2379 = lcars2379$value,
  lcars_alt = c("#FF9C00", "#F7BD5A", "#FFCC99", "#FFFF33", "#FFFF9C", "#CD6363", "#CC99CC",
                 "#FF9E63", "#646DCC", "#9C9CFF", "#3399FF", "#99CCFF", "#FFFFCC", "#B1957A",
                 "#ED884C", "#F5ED00", "#DDFFFF"),
  lcars_first_contact = c("#C198B0", "#B46757", "#AE697D", "#97567B", "#C67825", "#B28452", "#C2B74B", "#BEBCDF"),
  lcars_nemesis = c("#0A45EE", "#3786FF", "#4BB0FF", "#87EEFF", "#46616E", "#D45F10", "#A35A1A", "#A89B35", "#DFAF71", "#ACA98A"),
  lcars_nx01 = c("#BDEFFF", "#009CCE", "#DEFFB5", "#CD6363", "#E7FFFF", "#4D6184"),
  lcars_29c = c("#39C924", "#72E2E4", "#20788C", "#24BEE2", "#BC956E", "#D19FA2", "#805070", "#2062EE"),
  lcars_23c = c("#0000FF", "#99CCFF", "#6666FF", "#99FF66", "#009900", "#FF6633", "#66CCFF"),
  lcars_red_alert = c("#F517C3", "#Bf2D42", "#A30E24", "#330512", "#D9D5B8", "#F1DFBF", "#4C4D47", "#9E9993"),
  romulan = colorRampPalette(c("#1DF964", "#000000", "#429AFC"))(9),
  romulan2 = colorRampPalette(c("#80F2B3", "#363636", "#30E1EA"))(9),
  starfleet = c("#5B1414", "#AD722C", "#1A6384", "#2C6B70", "#483A4A", "#000000"),
  talaria = colorRampPalette(c("#1B1B1B", "#484848", "#9EB3BA", "#E1E1E1", "#928374", "#4B433C"))(9),
  tholian = colorRampPalette(c("#5E0000", "#F07266", "#E1E1E1", "#D2C69C", "#9A7B08"))(9),
  terran_empire = colorRampPalette(c("#000000", "#704D29", "#D4B293", "#D0CED1"))(9),
  ufp = colorRampPalette(c("#FFFFFF", "#201F7B"))(9),
  red_alert = c("#670000", "#990000", "#CD0000", "#FE0000", "#FF9190", "#4D4D4D"),
  yellow_alert = c("#674305", "#986509", "#CD870E", "#FFA90E", "#FFDA67", "#4D4D4D"),
  blue_alert = c("#0000CE", "#0033FF", "#0265FF", "#4259FF", "#8D9AFF", "#4D4D4D"),
  no_alert = c("#133D87", "#2350B5", "#335DA7", "#4A72CA", "#98C3E3", "#4D4D4D"),
  black_alert = c("#050B64", "#0E3A9B", "#307CE4", "#64FFFF", "#000000")
)

usethis::use_data(trekpals, overwrite = TRUE)
