lcars2357 <- data.frame(
  series = 2357L,
  name = c("pale-canary", "tanoi", "golden-tanoi", "neon-carrot", "eggplant", "lilac", "anakiwa", "mariner", "bahama-blue"),
  value = c("#FFFF99", "#FFCC99", "#FFCC66", "#FF9933", "#664466", "#CC99CC", "#99CCFF", "#3366CC", "#006699"),
  stringsAsFactors = FALSE
)

lcars2369 <- data.frame(
  series = 2369L,
  name = c("blue-bell", "melrose", "lilac", "hopbush", "chestnut-rose", "orange-peel", "atomic-tangerine", "golden-tanoi"),
  value = c("#9999CC", "#9999FF", "#CC99CC", "#CC6699", "#CC6666", "#FF9966", "#FF9900", "#FFCC66"),
  stringsAsFactors = FALSE
)

lcars2375 <- data.frame(
  series = 2375L,
  name = c("danub", "indigo", "lavender-purple", "cosmic", "red-damask", "medium-carmine", "bourbon", "sandy-brown"),
  value = c("#6688CC", "#4455BB","#9977AA", "#774466", "#DD6644", "#AA5533", "#BB6622", "#EE9955"),
  stringsAsFactors = FALSE
)

lcars2379 <- data.frame(
  series = 2379L,
  name = c("periwinkle", "dodger-pale", "dodger-soft", "near-blue", "navy-blue", "husk", "rust", "tamarillo"),
  value = c("#CCDDFF", "#5599FF", "#3366FF", "#0011EE", "#000088", "#BBAA55", "#BB4411", "#882211"),
  stringsAsFactors = FALSE
)

trekpals <- list(
  andorian = colorRampPalette(c("#202020", "#446D99", "#83BDD7", "#E4E4E4"))(9),
  bajoran = c("#C00000", "#7A6424", "#323C34", "#4838A8", "#E6D56E", "#A8B5A9"),
  borg = c("#253741", "#5C849B", "#9EB3BA", "#E8D159", "#A68528", "#604E20"),
  breen = c("#56483D", "#332822", "#DFCDB9", "#996601", "#8BC95A", "#6C696F", "#F1E899", "#EE711E"),
  breen2 = colorRampPalette(c("#7E0500", "#CE1800", "#EF6F00", "#F7BD00", "#E4E4E4"))(9),
  dominion = c("#313131", "#255268", "#620062", "#63A542", "#A5C6D6", "#B5D6A5", "#B900B9"),
  enara = colorRampPalette(c("#4D004D", "#800080", "#F46404", "#E7D057", "#E9E09C"))(9),
  enara2 = c("#262626", "#3D5983", "#5A8A54", "#CFB023"),
  ferengi = colorRampPalette(c("#00740E", "#E4E4E4", "#C86B32"))(9),
  gorn = c("#000042", "#0000B5", "#145416", "#639863", "#BDF7C6", "#FF0000", "#4E0000", "#A09349", "#777384"),
  iconian = colorRampPalette(c("#633210", "#B85C1D", "#FFFFFF", "#6B666C"))(9),
  klingon = rev(colorRampPalette(c("#000000", "#330000", "#660000", "#990000", "#CA0000", "#CA6400", "#C99400", "#FFFA0C"))(9)),
  lcars_series = unique(c(lcars2357$value, lcars2369$value, lcars2375$value, lcars2379$value)),
  lcars_2357 = lcars2357$value,
  lcars_2369 = lcars2369$value,
  lcars_2375 = lcars2375$value,
  lcars_2379 = lcars2379$value,
  lcars_alt = c("#FF9C00", "#F7BD5A", "#FFCC99", "#FFFF33", "#FFFF9C", "#CD6363", "#CC99CC",
                 "#FF9E63", "#646DCC", "#9C9CFF", "#3399FF", "#99CCFF", "#FFFFCC", "#B1957A",
                 "#ED884C", "#F5ED00", "#DDFFFF"),
  lcars_first_contact = c("#C198B0", "#B46757", "#AE697D", "#97567B", "#C67825", "#B28452", "#C2B74B", "#BEBCDF"),
  lcars_nemesis = c("#0A45EE", "#3786FF", "#4BB0FF", "#87EEFF", "#46616E", "#D45F10", "#A35A1A", "#A89B35", "#DFAF71", "#ACA98A"),
  lcars_nx01 = c("#BDEFFF", "#009CCE", "#DEFFB5", "#CD6363", "#E7FFFF", "#4D6184"),
  lcars_29c = c("#39C924", "#72E2E4", "#20788C", "#24BEE2", "#BC956E", "#D19FA2", "#805070", "#2062EE"),
  lcars_23c = c("#0000FF", "#99CCFF", "#6666FF", "#99FF66", "#009900", "#FF6633", "#66CCFF"),
  lcars_red_alert = c("#F517C3", "#Bf2D42", "#A30E24", "#330512", "#D9D5B8", "#F1DFBF", "#4C4D47", "#9E9993"),
  lcars_cardassian = c("#B46356", "#944D40", "#7A4B42", "#CA480D", "#9B5928", "#C86C18",
                       "#D78017", "#F9AB3C", "#FFE705", "#FFF7A3", "#E2ED50",
                       "#2F7270", "#66FFFF", "#3C999C", "#8BEAFF", "#13A4EB", "#2E7BC5",
                       "#A1B3E2", "#BFCAFE", "#8B799C", "#524559"),
  romulan = colorRampPalette(c("#1DF964", "#000000", "#429AFC"))(9),
  romulan2 = colorRampPalette(c("#80F2B3", "#363636", "#30E1EA"))(9),
  starfleet = c("#5B1414", "#AD722C", "#1A6384"),
  starfleet2 = c("#5B1414", "#AD722C", "#1A6384", "#2C6B70", "#483A4A", "#000000"),
  tholian = colorRampPalette(c("#5E0000", "#F07266", "#E1E1E1", "#D2C69C", "#9A7B08"))(9),
  terran = colorRampPalette(c("#000000", "#704D29", "#D4B293", "#D0CED1"))(9),
  ufp = colorRampPalette(c("#E4E4E4", "#201F7B"))(9),
  red_alert = c("#670000", "#990000", "#CD0000", "#FE0000", "#FF9190", "#4D4D4D"),
  yellow_alert = c("#674305", "#986509", "#CD870E", "#FFA90E", "#FFDA67", "#4D4D4D"),
  black_alert = c("#050B64", "#0E3A9B", "#307CE4", "#64FFFF", "#000000")
)

usethis::use_data(trekpals, overwrite = TRUE)

.lcars2357 <- setNames(lcars2357$value, lcars2357$name)
.lcars2369 <- setNames(lcars2369$value, lcars2369$name)
.lcars2375 <- setNames(lcars2375$value, lcars2375$name)
.lcars2379 <- setNames(lcars2379$value, lcars2379$name)
.lcarscolors <- c(.lcars2357, .lcars2369, .lcars2375, .lcars2379)
.lcarscolors <- .lcarscolors[!duplicated(.lcarscolors)]

.lcars_pals <- list(
  `2357` = trekpals[["lcars_2357"]],
  `2369` = trekpals[["lcars_2369"]],
  `2375` = trekpals[["lcars_2375"]],
  `2379` = trekpals[["lcars_2379"]],
  `alt` = trekpals[["lcars_alt"]],
  `first_contact` = trekpals[["lcars_first_contact"]],
  `nemesis` = trekpals[["lcars_nemesis"]],
  `nx01` = trekpals[["lcars_nx01"]],
  `23c` = trekpals[["lcars_23c"]],
  `29c` = trekpals[["lcars_29c"]],
  `red_alert` = trekpals[["lcars_red_alert"]],
  `cardassian` = trekpals[["lcars_cardassian"]]
)

usethis::use_data(.lcars2357, .lcars2369, .lcars2375, .lcars2379, .lcarscolors, .lcars_pals, internal = TRUE, overwrite = TRUE)
