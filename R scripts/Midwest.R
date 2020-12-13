library(ggplot2)

# Import county data
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files")
county.data <- read.csv(file="county_demo_health.csv")
voting.data <- read.csv(file="voting by county.csv")
stadium.data <- read.csv(file="games with fans-wk 4.csv")
mask.data <- read.csv(file="mask mandates.csv")

# -----MINNESOTA-----

# String variables for counties in Minneapolis-St. Paul MSA (to simplify code below)
c1 <- "Hennepin,MN"
c2 <- "Ramsey,MN"
c3 <- "Dakota,MN"
c4 <- "Anoka,MN"
c5 <- "Washington,MN"
c6 <- "Scott,MN"
c7 <- "Wright,MN"
c8 <- "Carver,MN"
c9 <- "Sherburne,MN"
c10 <- "St. Croix,WI"
c11 <- "Chisago,MN"
c12 <- "Pierce,WI"
c13 <- "Isanti,MN"
c14 <- "Le Sueur,MN"
c15 <- "Mille Lacs,MN"
c16 <- "Sibley,MN"

# Set directory for Minneapolis-St. Paul MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/MIN")

# -----HENNEPIN COUNTY-----

hennepin <- read.csv(file="hennepin_county.csv")
hennepin$FixedDate <- as.Date(hennepin$Date,format="%Y-%m-%d")
hennepin <- hennepin[-c(1:204), ]
hennepin <- hennepin[complete.cases(hennepin),]

# -----RAMSEY COUNTY-----

ramsey <- read.csv(file="ramsey_county.csv")
ramsey$FixedDate <- as.Date(ramsey$Date,format="%Y-%m-%d")
ramsey <- ramsey[-c(1:204), ]
ramsey <- ramsey[complete.cases(ramsey),]

# -----DAKOTA COUNTY-----

dakota <- read.csv(file="dakota_county.csv")
dakota$FixedDate <- as.Date(dakota$Date,format="%Y-%m-%d")
dakota <- dakota[-c(1:204), ]
dakota <- dakota[complete.cases(dakota),]

# -----ANOKA COUNTY-----

anoka <- read.csv(file="anoka_county.csv")
anoka$FixedDate <- as.Date(anoka$Date,format="%Y-%m-%d")
anoka <- anoka[-c(1:204), ]
anoka <- anoka[complete.cases(anoka),]

# -----WASHINGTON COUNTY-----

washington <- read.csv(file="washington_county.csv")
washington$FixedDate <- as.Date(washington$Date,format="%Y-%m-%d")
washington <- washington[-c(1:204), ]
washington <- washington[complete.cases(washington),]

# -----SCOTT COUNTY-----

scott <- read.csv(file="scott_county.csv")
scott$FixedDate <- as.Date(scott$Date,format="%Y-%m-%d")
scott <- scott[-c(1:204), ]
scott <- scott[complete.cases(scott),]

# -----WRIGHT COUNTY-----

wright <- read.csv(file="wright_county.csv")
wright$FixedDate <- as.Date(wright$Date,format="%Y-%m-%d")
wright <- wright[-c(1:204), ]
wright <- wright[complete.cases(wright),]

# -----CARVER COUNTY-----

carver <- read.csv(file="carver_county.csv")
carver$FixedDate <- as.Date(carver$Date,format="%Y-%m-%d")
carver <- carver[-c(1:204), ]
carver <- carver[complete.cases(carver),]

# -----SHERBURNE COUNTY-----

sherburne <- read.csv(file="sherburne_county.csv")
sherburne$FixedDate <- as.Date(sherburne$Date,format="%Y-%m-%d")
sherburne <- sherburne[-c(1:204), ]
sherburne <- sherburne[complete.cases(sherburne),]

# -----ST. CROIX COUNTY-----

st_croix <- read.csv(file="st_croix_county.csv")
st_croix$FixedDate <- as.Date(st_croix$Date,format="%Y-%m-%d")
st_croix <- st_croix[-c(1:204), ]
st_croix <- st_croix[complete.cases(st_croix),]

# -----CHIASGO COUNTY-----

chisago <- read.csv(file="chisago_county.csv")
chisago$FixedDate <- as.Date(chisago$Date,format="%Y-%m-%d")
chisago <- chisago[-c(1:204), ]
chisago <- chisago[complete.cases(chisago),]

# -----PIERCE COUNTY-----

pierce <- read.csv(file="pierce_county.csv")
pierce$FixedDate <- as.Date(pierce$Date,format="%Y-%m-%d")
pierce <- pierce[-c(1:204), ]
pierce <- pierce[complete.cases(pierce),]

# -----ISANTI COUNTY-----

isanti <- read.csv(file="isanti_county.csv")
isanti$FixedDate <- as.Date(isanti$Date,format="%Y-%m-%d")
isanti <- isanti[-c(1:204), ]
isanti <- isanti[complete.cases(isanti),]

# -----LE SUEUR COUNTY-----

le_sueur <- read.csv(file="le_sueur_county.csv")
le_sueur$FixedDate <- as.Date(le_sueur$Date,format="%Y-%m-%d")
le_sueur <- le_sueur[-c(1:204), ]
le_sueur <- le_sueur[complete.cases(le_sueur),]

# -----MILLE LACS COUNTY-----

mille_lacs <- read.csv(file="mille_lacs_county.csv")
mille_lacs$FixedDate <- as.Date(mille_lacs$Date,format="%Y-%m-%d")
mille_lacs <- mille_lacs[-c(1:204), ]
mille_lacs <- mille_lacs[complete.cases(mille_lacs),]

# -----SIBLEY COUNTY-----

sibley <- read.csv(file="sibley_county.csv")
sibley$FixedDate <- as.Date(sibley$Date,format="%Y-%m-%d")
sibley <- sibley[-c(1:204), ]
sibley <- sibley[complete.cases(sibley),]

# -----Data frame updates-----

midwest <- data.frame("County" = "Hennepin", "Rt" = mean(hennepin[,"Rt"]),
                "Smoke" = county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                "Household" = county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                "Density" = county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                "College" = county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                "R_Voting" = voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                "Black_His" = (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                "No_Fans" = stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                "Under_Ten" = stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                "Ten_to_Twenty" = stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                "Mask" = mask.data$MANDATE[mask.data$COUNTY==c1])

midwest <- rbind(midwest, list ("Ramsey", mean(ramsey[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Dakota", mean(dakota[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Anoka", mean(anoka[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Washington", mean(washington[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Scott", mean(scott[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Wright", mean(wright[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Carver", mean(carver[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Sherburne", mean(sherburne[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("St. Croix", mean(st_croix[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Chisago", mean(chisago[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Pierce", mean(pierce[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Isanti", mean(isanti[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Le Sueur", mean(le_sueur[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Mille Lacs", mean(mille_lacs[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c15],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c15],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c15],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c15],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c15],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c15] + county.data$PER_HIS[county.data$COUNTY_ABBR==c15]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Sibley", mean(sibley[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c16],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c16],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c16],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c16],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c16],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c16] + county.data$PER_HIS[county.data$COUNTY_ABBR==c16]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----Rt plot-----

hennepin.data <- read.csv(file="hennepin_county.csv")
hennepin.data$FixedDate <- as.Date(hennepin.data$Date,format="%Y-%m-%d")
hennepin.data <- hennepin.data[-c(1:87), ]

midwest.plot <- ggplot() + geom_line(aes(y = Rt, x = Date, group = 1),
                                     data = hennepin.data, color="#4F2683")

# -----KANSAS CITY-----

# String variables for counties in Kansas City MSA (to simplify code below)
c1 <- "Jackson,MO"
c2 <- "Johnson,KS"
c3 <- "Clay,MO"
c4 <- "Wyandotte,KS"
c5 <- "Cass,MO"
c6 <- "Platte,MO"
c7 <- "Leavenworth,KS"
c8 <- "Miami,KS"
c9 <- "Lafayette,MO"
c10 <- "Ray,MO"
c11 <- "Clinton,MO"
c12 <- "Bates,MO"
c13 <- "Linn,KS"
c14 <- "Caldwell,MO"

# Set directory for Kansas City MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/KC")

# -----JACKSON COUNTY-----

jackson <- read.csv(file="jackson_county.csv")
jackson$FixedDate <- as.Date(jackson$Date,format="%Y-%m-%d")
jackson <- jackson[-c(1:204), ]
jackson <- jackson[complete.cases(jackson),]

# -----JOHNSON COUNTY-----

johnson_ks <- read.csv(file="johnson_county.csv")
johnson_ks$FixedDate <- as.Date(johnson_ks$Date,format="%Y-%m-%d")
johnson_ks <- johnson_ks[-c(1:204), ]
johnson_ks <- johnson_ks[complete.cases(johnson_ks),]

# -----CLAY COUNTY-----

clay <- read.csv(file="clay_county.csv")
clay$FixedDate <- as.Date(clay$Date,format="%Y-%m-%d")
clay <- clay[-c(1:204), ]
clay <- clay[complete.cases(clay),]

# -----WYANDOTTE COUNTY-----

wyandotte <- read.csv(file="wyandotte_county.csv")
wyandotte$FixedDate <- as.Date(wyandotte$Date,format="%Y-%m-%d")
wyandotte <- wyandotte[-c(1:204), ]
wyandotte <- wyandotte[complete.cases(wyandotte),]

# -----CASS COUNTY-----

cass <- read.csv(file="cass_county.csv")
cass$FixedDate <- as.Date(cass$Date,format="%Y-%m-%d")
cass <- cass[-c(1:204), ]
cass <- cass[complete.cases(cass),]

# -----PLATTE COUNTY-----

platte <- read.csv(file="platte_county.csv")
platte$FixedDate <- as.Date(platte$Date,format="%Y-%m-%d")
platte <- platte[-c(1:204), ]
platte <- platte[complete.cases(platte),]

# -----LEAVENWORTH COUNTY-----

leavenworth <- read.csv(file="leavenworth_county.csv")
leavenworth$FixedDate <- as.Date(leavenworth$Date,format="%Y-%m-%d")
leavenworth <- leavenworth[-c(1:204), ]
leavenworth <- leavenworth[complete.cases(leavenworth),]

# -----MIAMI COUNTY-----

miami <- read.csv(file="miami_county.csv")
miami$FixedDate <- as.Date(miami$Date,format="%Y-%m-%d")
miami <- miami[-c(1:204), ]
miami <- miami[complete.cases(miami),]

# -----LAFAYETTE COUNTY-----

lafayette <- read.csv(file="lafayette_county.csv")
lafayette$FixedDate <- as.Date(lafayette$Date,format="%Y-%m-%d")
lafayette <- lafayette[-c(1:204), ]
lafayette <- lafayette[complete.cases(lafayette),]

# -----RAY COUNTY-----

ray <- read.csv(file="ray_county.csv")
ray$FixedDate <- as.Date(ray$Date,format="%Y-%m-%d")
ray <- ray[-c(1:204), ]
ray <- ray[complete.cases(ray),]

# -----CLINTON COUNTY-----

clinton <- read.csv(file="clinton_county.csv")
clinton$FixedDate <- as.Date(clinton$Date,format="%Y-%m-%d")
clinton <- clinton[-c(1:204), ]
clinton <- clinton[complete.cases(clinton),]

# -----BATES COUNTY-----

bates <- read.csv(file="bates_county.csv")
bates$FixedDate <- as.Date(bates$Date,format="%Y-%m-%d")
bates <- bates[-c(1:204), ]
bates <- bates[complete.cases(bates),]

# -----LINN COUNTY-----

linn <- read.csv(file="linn_county.csv")
linn$FixedDate <- as.Date(linn$Date,format="%Y-%m-%d")
linn <- linn[-c(1:204), ]
linn <- linn[complete.cases(linn),]

# -----CALDWELL COUNTY-----

caldwell <- read.csv(file="caldwell_county.csv")
caldwell$FixedDate <- as.Date(caldwell$Date,format="%Y-%m-%d")
caldwell <- caldwell[-c(1:204), ]
caldwell <- caldwell[complete.cases(caldwell),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Jackson", mean(jackson[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Johnson (KS)", mean(johnson_ks[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Clay", mean(clay[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Wyandotte", mean(wyandotte[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Cass", mean(cass[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Platte", mean(platte[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Leavenworth", mean(leavenworth[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Miami", mean(miami[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Lafayette", mean(lafayette[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Ray", mean(ray[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Clinton", mean(clinton[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Bates", mean(bates[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Linn", mean(linn[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Caldwell", mean(caldwell[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----Rt plot-----

johnson.data <- read.csv(file="johnson_county.csv")
johnson.data$FixedDate <- as.Date(johnson.data$Date,format="%Y-%m-%d")
johnson.data <- johnson.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = johnson.data, color="#E31837")

# -----GREEN BAY-----

# String variables for counties in Green Bay MSA (to simplify code below)
c1 <- "Brown,WI"
c2 <- "Kewaunee,WI"
c3 <- "Oconto,WI"

# Set directory for Green Bay MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/GB")

# -----BROWN COUNTY-----

brown_wi <- read.csv(file="brown_county.csv")
brown_wi$FixedDate <- as.Date(brown_wi$Date,format="%Y-%m-%d")
brown_wi <- brown_wi[-c(1:204), ]
brown_wi <- brown_wi[complete.cases(brown_wi),]

# -----KEWAUNEE COUNTY-----

kewaunee <- read.csv(file="kewaunee_county.csv")
kewaunee$FixedDate <- as.Date(kewaunee$Date,format="%Y-%m-%d")
kewaunee <- kewaunee[-c(1:204), ]
kewaunee <- kewaunee[complete.cases(kewaunee),]

# -----OCONTO COUNTY-----

oconto <- read.csv(file="oconto_county.csv")
oconto$FixedDate <- as.Date(oconto$Date,format="%Y-%m-%d")
oconto <- oconto[-c(1:204), ]
oconto <- oconto[complete.cases(oconto),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Brown (WI)", mean(brown_wi[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Kewaunee", mean(kewaunee[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Oconto", mean(oconto[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----Rt plot-----

brown.data <- read.csv(file="brown_county.csv")
brown.data$FixedDate <- as.Date(brown.data$Date,format="%Y-%m-%d")
brown.data <- brown.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = brown.data, color="#203731")

# -----CHICAGO-----

# String variables for counties in Chicago MSA (to simplify code below)
c1 <- "Cook,IL"
c2 <- "DeKalb,IL"
c3 <- "DuPage,IL"
c4 <- "Grundy,IL"
c5 <- "Kankakee,IL"
c6 <- "Kane,IL"
c7 <- "Kendall,IL"
c8 <- "McHenry,IL"
c9 <- "Will,IL"
c10 <- "Jasper,IN"
c11 <- "Lake,IN"
c12 <- "Newton,IN"
c13 <- "Porter,IN"
c14 <- "Lake,IL"
c15 <- "Kenosha,WI"

# Set directory for Chicago MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/CHI")

# -----COOK COUNTY-----

cook <- read.csv(file="cook_county.csv")
cook$FixedDate <- as.Date(cook$Date,format="%Y-%m-%d")
cook <- cook[-c(1:204), ]
cook <- cook[complete.cases(cook),]

# -----DEKALB COUNTY-----

dekalb <- read.csv(file="dekalb_county.csv")
dekalb$FixedDate <- as.Date(dekalb$Date,format="%Y-%m-%d")
dekalb <- dekalb[-c(1:204), ]
dekalb <- dekalb[complete.cases(dekalb),]

# -----DUPAGE COUNTY-----

dupage <- read.csv(file="dupage_county.csv")
dupage$FixedDate <- as.Date(dupage$Date,format="%Y-%m-%d")
dupage <- dupage[-c(1:204), ]
dupage <- dupage[complete.cases(dupage),]

# -----GRUNDY COUNTY-----

grundy <- read.csv(file="grundy_county.csv")
grundy$FixedDate <- as.Date(grundy$Date,format="%Y-%m-%d")
grundy <- grundy[-c(1:204), ]
grundy <- grundy[complete.cases(grundy),]

# -----KANKAKEE COUNTY-----

kankakee <- read.csv(file="kankakee_county.csv")
kankakee$FixedDate <- as.Date(kankakee$Date,format="%Y-%m-%d")
kankakee <- kankakee[-c(1:204), ]
kankakee <- kankakee[complete.cases(kankakee),]

# -----KANE COUNTY-----

kane <- read.csv(file="kane_county.csv")
kane$FixedDate <- as.Date(kane$Date,format="%Y-%m-%d")
kane <- kane[-c(1:204), ]
kane <- kane[complete.cases(kane),]

# -----KENDALL COUNTY-----

kendall <- read.csv(file="kendall_county.csv")
kendall$FixedDate <- as.Date(kendall$Date,format="%Y-%m-%d")
kendall <- kendall[-c(1:204), ]
kendall <- kendall[complete.cases(kendall),]

# -----MCHENRY COUNTY-----

mchenry <- read.csv(file="mchenry_county.csv")
mchenry$FixedDate <- as.Date(mchenry$Date,format="%Y-%m-%d")
mchenry <- mchenry[-c(1:204), ]
mchenry <- mchenry[complete.cases(mchenry),]

# -----WILL COUNTY-----

will <- read.csv(file="will_county.csv")
will$FixedDate <- as.Date(will$Date,format="%Y-%m-%d")
will <- will[-c(1:204), ]
will <- will[complete.cases(will),]

# -----JASPER COUNTY-----

jasper <- read.csv(file="jasper_county.csv")
jasper$FixedDate <- as.Date(jasper$Date,format="%Y-%m-%d")
jasper <- jasper[-c(1:204), ]
jasper <- jasper[complete.cases(jasper),]

# -----LAKE COUNTY (IN)-----

lake_in <- read.csv(file="lake_in_county.csv")
lake_in$FixedDate <- as.Date(lake_in$Date,format="%Y-%m-%d")
lake_in <- lake_in[-c(1:204), ]
lake_in <- lake_in[complete.cases(lake_in),]

# -----NEWTON COUNTY-----

newton <- read.csv(file="newton_county.csv")
newton$FixedDate <- as.Date(newton$Date,format="%Y-%m-%d")
newton <- newton[-c(1:204), ]
newton <- newton[complete.cases(newton),]

# -----PORTER COUNTY-----

porter <- read.csv(file="porter_county.csv")
porter$FixedDate <- as.Date(porter$Date,format="%Y-%m-%d")
porter <- porter[-c(1:204), ]
porter <- porter[complete.cases(porter),]

# -----LAKE COUNTY (IL)-----

lake_il <- read.csv(file="lake_il_county.csv")
lake_il$FixedDate <- as.Date(lake_il$Date,format="%Y-%m-%d")
lake_il <- lake_il[-c(1:204), ]
lake_il <- lake_il[complete.cases(lake_il),]

# -----KENOSHA COUNTY-----

kenosha <- read.csv(file="kenosha_county.csv")
kenosha$FixedDate <- as.Date(kenosha$Date,format="%Y-%m-%d")
kenosha <- kenosha[-c(1:204), ]
kenosha <- kenosha[complete.cases(kenosha),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Cook", mean(cook[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("DeKalb", mean(dekalb[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("DuPage", mean(dupage[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Grundy", mean(grundy[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Kankakee", mean(kankakee[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Kane", mean(kane[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Kendall", mean(kendall[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("McHenry", mean(mchenry[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Will", mean(will[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Jasper", mean(jasper[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Lake (IN)", mean(lake_in[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Newton", mean(newton[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Porter", mean(porter[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Lake (IL)", mean(lake_il[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Kenosha", mean(kenosha[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c15],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c15],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c15],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c15],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c15],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c15] + county.data$PER_HIS[county.data$COUNTY_ABBR==c15]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----Rt plot-----

cook.data <- read.csv(file="cook_county.csv")
cook.data$FixedDate <- as.Date(cook.data$Date,format="%Y-%m-%d")
cook.data <- cook.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = cook.data, color="#0b162a")

# -----DETROIT-----

# String variables for counties in Detroit MSA (to simplify code below)
c1 <- "Lapeer,MI"
c2 <- "Livingston,MI"
c3 <- "Macomb,MI"
c4 <- "Oakland,MI"
c5 <- "St. Clair,MI"
c6 <- "Wayne,MI"

# Set directory for Detroit MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/DET")

# -----LAPEER COUNTY-----

lapeer <- read.csv(file="lapeer_county.csv")
lapeer$FixedDate <- as.Date(lapeer$Date,format="%Y-%m-%d")
lapeer <- lapeer[-c(1:204), ]
lapeer <- lapeer[complete.cases(lapeer),]

# -----LIVINGSTON COUNTY-----

livingston <- read.csv(file="livingston_county.csv")
livingston$FixedDate <- as.Date(livingston$Date,format="%Y-%m-%d")
livingston <- livingston[-c(1:204), ]
livingston <- livingston[complete.cases(livingston),]

# -----MACOMB COUNTY-----

macomb <- read.csv(file="macomb_county.csv")
macomb$FixedDate <- as.Date(macomb$Date,format="%Y-%m-%d")
macomb <- macomb[-c(1:204), ]
macomb <- macomb[complete.cases(macomb),]

# -----OAKLAND COUNTY-----

oakland <- read.csv(file="oakland_county.csv")
oakland$FixedDate <- as.Date(oakland$Date,format="%Y-%m-%d")
oakland <- oakland[-c(1:204), ]
oakland <- oakland[complete.cases(oakland),]

# -----ST. CLAIR COUNTY-----

st_clair <- read.csv(file="st_clair_county.csv")
st_clair$FixedDate <- as.Date(st_clair$Date,format="%Y-%m-%d")
st_clair <- st_clair[-c(1:204), ]
st_clair <- st_clair[complete.cases(st_clair),]

# -----WAYNE COUNTY-----

wayne <- read.csv(file="wayne_county.csv")
wayne$FixedDate <- as.Date(wayne$Date,format="%Y-%m-%d")
wayne <- wayne[-c(1:204), ]
wayne <- wayne[complete.cases(wayne),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Lapeer", mean(lapeer[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

midwest <- rbind(midwest, list ("Livingston", mean(livingston[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

midwest <- rbind(midwest, list ("Macomb", mean(macomb[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

midwest <- rbind(midwest, list ("Oakland", mean(oakland[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

midwest <- rbind(midwest, list ("St. Clair", mean(st_clair[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

midwest <- rbind(midwest, list ("Wayne", mean(wayne[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

# -----Rt plot-----

wayne.data <- read.csv(file="wayne_county.csv")
wayne.data$FixedDate <- as.Date(wayne.data$Date,format="%Y-%m-%d")
wayne.data <- wayne.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = wayne.data, color="#0076b6")

#midwest.plot

# -----INDIANAPOLIS-----

# String variables for counties in Indianapolis MSA (to simplify code below)
c1 <- "Marion,IN"
c2 <- "Hamilton,IN"
c3 <- "Hendricks,IN"
c4 <- "Johnson,IN"
c5 <- "Madison,IN"
c6 <- "Hancock,IN"
c7 <- "Morgan,IN"
c8 <- "Boone,IN"
c9 <- "Shelby,IN"
c10 <- "Putnam,IN"
c11 <- "Brown,IN"

# Set directory for Indianapolis MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/IND")

# -----MARION COUNTY-----

marion <- read.csv(file="marion_county.csv")
marion$FixedDate <- as.Date(marion$Date,format="%Y-%m-%d")
marion <- marion[-c(1:204), ]
marion <- marion[complete.cases(marion),]

# -----HAMILTON COUNTY-----

hamilton_in <- read.csv(file="hamilton_county.csv")
hamilton_in$FixedDate <- as.Date(hamilton_in$Date,format="%Y-%m-%d")
hamilton_in <- hamilton_in[-c(1:204), ]
hamilton_in <- hamilton_in[complete.cases(hamilton_in),]

# -----HENDRICKS COUNTY-----

hendricks <- read.csv(file="hendricks_county.csv")
hendricks$FixedDate <- as.Date(hendricks$Date,format="%Y-%m-%d")
hendricks <- hendricks[-c(1:204), ]
hendricks <- hendricks[complete.cases(hendricks),]

# -----JOHNSON COUNTY-----

johnson_in <- read.csv(file="johnson_county.csv")
johnson_in$FixedDate <- as.Date(johnson_in$Date,format="%Y-%m-%d")
johnson_in <- johnson_in[-c(1:204), ]
johnson_in <- johnson_in[complete.cases(johnson_in),]

# -----MADISON COUNTY-----

madison <- read.csv(file="madison_county.csv")
madison$FixedDate <- as.Date(madison$Date,format="%Y-%m-%d")
madison <- madison[-c(1:204), ]
madison <- madison[complete.cases(madison),]

# -----HANCOCK COUNTY-----

hancock <- read.csv(file="hancock_county.csv")
hancock$FixedDate <- as.Date(hancock$Date,format="%Y-%m-%d")
hancock <- hancock[-c(1:204), ]
hancock <- hancock[complete.cases(hancock),]

# -----MORGAN COUNTY-----

morgan <- read.csv(file="morgan_county.csv")
morgan$FixedDate <- as.Date(morgan$Date,format="%Y-%m-%d")
morgan <- morgan[-c(1:204), ]
morgan <- morgan[complete.cases(morgan),]

# -----BOONE COUNTY-----

boone_in <- read.csv(file="boone_county.csv")
boone_in$FixedDate <- as.Date(boone_in$Date,format="%Y-%m-%d")
boone_in <- boone_in[-c(1:204), ]
boone_in <- boone_in[complete.cases(boone_in),]

# -----SHELBY COUNTY-----

shelby <- read.csv(file="shelby_county.csv")
shelby$FixedDate <- as.Date(shelby$Date,format="%Y-%m-%d")
shelby <- shelby[-c(1:204), ]
shelby <- shelby[complete.cases(shelby),]

# -----PUTNAM COUNTY-----

putnam <- read.csv(file="putnam_county.csv")
putnam$FixedDate <- as.Date(putnam$Date,format="%Y-%m-%d")
putnam <- putnam[-c(1:204), ]
putnam <- putnam[complete.cases(putnam),]

# -----BROWN COUNTY-----

brown_in <- read.csv(file="brown_county.csv")
brown_in$FixedDate <- as.Date(brown_in$Date,format="%Y-%m-%d")
brown_in <- brown_in[-c(1:204), ]
brown_in <- brown_in[complete.cases(brown_in),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Marion", mean(marion[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Hamilton (IN)", mean(hamilton_in[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Hendricks", mean(hendricks[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Johnson (IN)", mean(johnson_in[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Madison", mean(madison[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Hancock", mean(hancock[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Morgan", mean(morgan[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Boone (IN)", mean(boone_in[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Shelby", mean(shelby[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Putnam", mean(putnam[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Brown (IN)", mean(brown_in[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----Rt plot-----

marion.data <- read.csv(file="marion_county.csv")
marion.data$FixedDate <- as.Date(marion.data$Date,format="%Y-%m-%d")
marion.data <- marion.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = marion.data, color="#002c5f")

# -----CINCINNATI-----

# String variables for counties in Cincinnati MSA (to simplify code below)
c1 <- "Butler,OH"
c2 <- "Warren,OH"
c3 <- "Hamilton,OH"
c4 <- "Clermont,OH"
c5 <- "Brown,OH"
c6 <- "Dearborn,IN"
c7 <- "Ohio,IN"
c8 <- "Union,IN"
c9 <- "Franklin,IN"
c10 <- "Boone,KY"
c11 <- "Bracken,KY"
c12 <- "Campbell,KY"
c13 <- "Gallatin,KY"
c14 <- "Grant,KY"
c15 <- "Kenton,KY"
c16 <- "Pendleton,KY"

# Set directory for Cincinnati MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/CIN")

# -----BUTLER COUNTY-----

butler <- read.csv(file="butler_county.csv")
butler$FixedDate <- as.Date(butler$Date,format="%Y-%m-%d")
butler <- butler[-c(1:204), ]
butler <- butler[complete.cases(butler),]

# -----WARREN COUNTY-----

warren <- read.csv(file="warren_county.csv")
warren$FixedDate <- as.Date(warren$Date,format="%Y-%m-%d")
warren <- warren[-c(1:204), ]
warren <- warren[complete.cases(warren),]

# -----HAMILTON COUNTY-----

hamilton_oh <- read.csv(file="hamilton_county.csv")
hamilton_oh$FixedDate <- as.Date(hamilton_oh$Date,format="%Y-%m-%d")
hamilton_oh <- hamilton_oh[-c(1:204), ]
hamilton_oh <- hamilton_oh[complete.cases(hamilton_oh),]

# -----CLERMONT COUNTY-----

clermont <- read.csv(file="clermont_county.csv")
clermont$FixedDate <- as.Date(clermont$Date,format="%Y-%m-%d")
clermont <- clermont[-c(1:204), ]
clermont <- clermont[complete.cases(clermont),]

# -----BROWN COUNTY-----

brown_oh <- read.csv(file="brown_county.csv")
brown_oh$FixedDate <- as.Date(brown_oh$Date,format="%Y-%m-%d")
brown_oh <- brown_oh[-c(1:204), ]
brown_oh <- brown_oh[complete.cases(brown_oh),]

# -----DEARBORN COUNTY-----

dearborn <- read.csv(file="dearborn_county.csv")
dearborn$FixedDate <- as.Date(dearborn$Date,format="%Y-%m-%d")
dearborn <- dearborn[-c(1:204), ]
dearborn <- dearborn[complete.cases(dearborn),]

# -----OHIO COUNTY-----

ohio <- read.csv(file="ohio_county.csv")
ohio$FixedDate <- as.Date(ohio$Date,format="%Y-%m-%d")
ohio <- ohio[-c(1:204), ]
ohio <- ohio[complete.cases(ohio),]

# -----UNION COUNTY-----

union <- read.csv(file="union_county.csv")
union$FixedDate <- as.Date(union$Date,format="%Y-%m-%d")
union <- union[-c(1:204), ]
union <- union[complete.cases(union),]

# -----FRANKLIN COUNTY-----

franklin <- read.csv(file="franklin_county.csv")
franklin$FixedDate <- as.Date(franklin$Date,format="%Y-%m-%d")
franklin <- franklin[-c(1:204), ]
franklin <- franklin[complete.cases(franklin),]

# -----BOONE COUNTY-----

boone_ky <- read.csv(file="boone_county.csv")
boone_ky$FixedDate <- as.Date(boone_ky$Date,format="%Y-%m-%d")
boone_ky <- boone_ky[-c(1:204), ]
boone_ky <- boone_ky[complete.cases(boone_ky),]

# -----BRACKEN COUNTY-----

bracken <- read.csv(file="bracken_county.csv")
bracken$FixedDate <- as.Date(bracken$Date,format="%Y-%m-%d")
bracken <- bracken[-c(1:204), ]
bracken <- bracken[complete.cases(bracken),]

# -----CAMPBELL COUNTY-----

campbell <- read.csv(file="campbell_county.csv")
campbell$FixedDate <- as.Date(campbell$Date,format="%Y-%m-%d")
campbell <- campbell[-c(1:204), ]
campbell <- campbell[complete.cases(campbell),]

# -----GALLATIN COUNTY-----

gallatin <- read.csv(file="gallatin_county.csv")
gallatin$FixedDate <- as.Date(gallatin$Date,format="%Y-%m-%d")
gallatin <- gallatin[-c(1:204), ]
gallatin <- gallatin[complete.cases(gallatin),]

# -----GRANT COUNTY-----

grant <- read.csv(file="grant_county.csv")
grant$FixedDate <- as.Date(grant$Date,format="%Y-%m-%d")
grant <- grant[-c(1:204), ]
grant <- grant[complete.cases(grant),]

# -----KENTON COUNTY-----

kenton <- read.csv(file="kenton_county.csv")
kenton$FixedDate <- as.Date(kenton$Date,format="%Y-%m-%d")
kenton <- kenton[-c(1:204), ]
kenton <- kenton[complete.cases(kenton),]

# -----PENDLETON COUNTY-----

pendleton <- read.csv(file="pendleton_county.csv")
pendleton$FixedDate <- as.Date(pendleton$Date,format="%Y-%m-%d")
pendleton <- pendleton[-c(1:204), ]
pendleton <- pendleton[complete.cases(pendleton),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Butler", mean(butler[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Warren", mean(warren[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Hamilton (OH)", mean(hamilton_oh[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Clermont", mean(clermont[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Brown (OH)", mean(brown_oh[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Dearborn", mean(dearborn[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Ohio", mean(ohio[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Union", mean(union[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Franklin", mean(franklin[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Boone (KY)", mean(boone_ky[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Bracken", mean(bracken[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Campbell", mean(campbell[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Gallatin", mean(gallatin[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Grant", mean(grant[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Kenton", mean(kenton[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c15],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c15],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c15],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c15],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c15],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c15] + county.data$PER_HIS[county.data$COUNTY_ABBR==c15]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

midwest <- rbind(midwest, list ("Pendleton", mean(pendleton[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c16],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c16],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c16],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c16],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c16],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c16] + county.data$PER_HIS[county.data$COUNTY_ABBR==c16]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

# -----Rt plot-----

hamilton.data <- read.csv(file="hamilton_county.csv")
hamilton.data$FixedDate <- as.Date(hamilton.data$Date,format="%Y-%m-%d")
hamilton.data <- hamilton.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = hamilton.data, color="#fb4f14")

# -----CLEVELAND-----

# String variables for counties in Cleveland MSA (to simplify code below)
c1 <- "Cuyahoga,OH"
c2 <- "Geauga,OH"
c3 <- "Lake,OH"
c4 <- "Lorain,OH"
c5 <- "Medina,OH"

# Set directory for Cleveland MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/CLE")

# -----CUYAHOGA COUNTY-----

cuyahoga <- read.csv(file="cuyahoga_county.csv")
cuyahoga$FixedDate <- as.Date(cuyahoga$Date,format="%Y-%m-%d")
cuyahoga <- cuyahoga[-c(1:204), ]
cuyahoga <- cuyahoga[complete.cases(cuyahoga),]

# -----GEAUGA COUNTY-----

geauga <- read.csv(file="geauga_county.csv")
geauga$FixedDate <- as.Date(geauga$Date,format="%Y-%m-%d")
geauga <- geauga[-c(1:204), ]
geauga <- geauga[complete.cases(geauga),]

# -----LAKE COUNTY-----

lake_oh <- read.csv(file="lake_county.csv")
lake_oh$FixedDate <- as.Date(lake_oh$Date,format="%Y-%m-%d")
lake_oh <- lake_oh[-c(1:204), ]
lake_oh <- lake_oh[complete.cases(lake_oh),]

# -----LORAIN COUNTY-----

lorain <- read.csv(file="lorain_county.csv")
lorain$FixedDate <- as.Date(lorain$Date,format="%Y-%m-%d")
lorain <- lorain[-c(1:204), ]
lorain <- lorain[complete.cases(lorain),]

# -----MEDINA COUNTY-----

medina <- read.csv(file="medina_county.csv")
medina$FixedDate <- as.Date(medina$Date,format="%Y-%m-%d")
medina <- medina[-c(1:204), ]
medina <- medina[complete.cases(medina),]

# -----Data frame updates-----

midwest <- rbind(midwest, list ("Cuyahoga", mean(cuyahoga[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Geauga", mean(geauga[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Lake (OH)", mean(lake_oh[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Lorain", mean(lorain[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

midwest <- rbind(midwest, list ("Medina", mean(medina[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----Rt plot-----

cuyahoga.data <- read.csv(file="cuyahoga_county.csv")
cuyahoga.data$FixedDate <- as.Date(cuyahoga.data$Date,format="%Y-%m-%d")
cuyahoga.data <- cuyahoga.data[-c(1:87), ]

midwest.plot <- midwest.plot + geom_line(aes(y = Rt, x = Date, group = 1),
                                         data = cuyahoga.data, color="#ff3c00")

#mw_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + Mask, data=midwest)
mw_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + Mask + No_Fans + Under_Ten + Ten_to_Twenty, data=midwest)
#mw_fit <- lm(Rt ~ No_Fans + Under_Ten + Ten_to_Twenty, data=midwest)
summary(mw_fit)
#boxplot(mw_fit[['residuals']],main='Boxplot: Residuals',ylab='residual value')

#midwest.plot