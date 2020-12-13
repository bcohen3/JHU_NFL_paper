# Import county data
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files")
county.data <- read.csv(file="county_demo_health.csv")
voting.data <- read.csv(file="voting by county.csv")
stadium.data <- read.csv(file="games with fans-wk 4.csv")
mask.data <- read.csv(file="mask mandates.csv")

# -----PHILADELPHIA-----

# String variables for counties in Philadelphia MSA (to simplify code below)
c1 <- "Burlington,NJ"
c2 <- "Camden,NJ"
c3 <- "Gloucester,NJ"
c4 <- "Bucks,PA"
c5 <- "Chester,PA"
c6 <- "Montgomery,PA"
c7 <- "Delaware,PA"
c8 <- "Philadelphia,PA"
c9 <- "New Castle,DE"
c10 <- "Cecil,MD"
c11 <- "Salem,NJ"

# Set directory for Philadelphia MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/PHI")

# -----BURLINGTON COUNTY-----

burlington <- read.csv(file="burlington_county.csv")
burlington$FixedDate <- as.Date(burlington$Date,format="%Y-%m-%d")
burlington <- burlington[-c(1:204), ]
burlington <- burlington[complete.cases(burlington),]

# -----CAMDEN COUNTY-----

camden <- read.csv(file="camden_county.csv")
camden$FixedDate <- as.Date(camden$Date,format="%Y-%m-%d")
camden <- camden[-c(1:204), ]
camden <- camden[complete.cases(camden),]

# -----GLOUCESTER COUNTY-----

gloucester <- read.csv(file="gloucester_county.csv")
gloucester$FixedDate <- as.Date(gloucester$Date,format="%Y-%m-%d")
gloucester <- gloucester[-c(1:204), ]
gloucester <- gloucester[complete.cases(gloucester),]

# -----BUCKS COUNTY-----

bucks <- read.csv(file="bucks_county.csv")
bucks$FixedDate <- as.Date(bucks$Date,format="%Y-%m-%d")
bucks <- bucks[-c(1:204), ]
bucks <- bucks[complete.cases(bucks),]

# -----CHESTER COUNTY-----

chester <- read.csv(file="chester_county.csv")
chester$FixedDate <- as.Date(chester$Date,format="%Y-%m-%d")
chester <- chester[-c(1:204), ]
chester <- chester[complete.cases(chester),]

# -----MONTGOMERY COUNTY-----

montgomery <- read.csv(file="montgomery_county.csv")
montgomery$FixedDate <- as.Date(montgomery$Date,format="%Y-%m-%d")
montgomery <- montgomery[-c(1:204), ]
montgomery <- montgomery[complete.cases(montgomery),]

# -----DELAWARE COUNTY-----

delaware <- read.csv(file="delaware_county.csv")
delaware$FixedDate <- as.Date(delaware$Date,format="%Y-%m-%d")
delaware <- delaware[-c(1:204), ]
delaware <- delaware[complete.cases(delaware),]

# -----PHILADELPHIA COUNTY-----

philadelphia <- read.csv(file="philadelphia_county.csv")
philadelphia$FixedDate <- as.Date(philadelphia$Date,format="%Y-%m-%d")
philadelphia <- philadelphia[-c(1:204), ]
philadelphia <- philadelphia[complete.cases(philadelphia),]

# -----NEW CASTLE COUNTY-----

new_castle <- read.csv(file="new_castle_county.csv")
new_castle$FixedDate <- as.Date(new_castle$Date,format="%Y-%m-%d")
new_castle <- new_castle[-c(1:204), ]
new_castle <- new_castle[complete.cases(new_castle),]

# -----CECIL COUNTY-----

cecil <- read.csv(file="cecil_county.csv")
cecil$FixedDate <- as.Date(cecil$Date,format="%Y-%m-%d")
cecil <- cecil[-c(1:204), ]
cecil <- cecil[complete.cases(cecil),]

# -----SALEM COUNTY-----

salem <- read.csv(file="salem_county.csv")
salem$FixedDate <- as.Date(salem$Date,format="%Y-%m-%d")
salem <- salem[-c(1:204), ]
salem <- salem[complete.cases(salem),]

# -----Data frame updates-----

northeast <- data.frame("County" = "Burlington", "Rt" = mean(burlington[,"Rt"]),
                "Smoke" = county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                "Household" = county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                "Density" = county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                "College" = county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                "R_Voting" = voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                "Black_His" = (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                "No_Fans" = stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                "Under_Ten" = stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                "Mask" = mask.data$MANDATE[mask.data$COUNTY==c8])

northeast <- rbind(northeast, list ("Camden", mean(camden[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Gloucester", mean(gloucester[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Bucks", mean(bucks[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Chester", mean(chester[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Montgomery", mean(montgomery[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Delaware", mean(delaware[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Philadelphia", mean(philadelphia[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("New Castle", mean(new_castle[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Cecil", mean(cecil[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

northeast <- rbind(northeast, list ("Salem", mean(salem[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c8],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c8],
                    mask.data$MANDATE[mask.data$COUNTY==c8]))

# -----PITTSBURGH-----

# String variables for counties in Pittsburgh MSA (to simplify code below)
c1 <- "Allegheny,PA"
c2 <- "Armstrong,PA"
c3 <- "Beaver,PA"
c4 <- "Butler,PA"
c5 <- "Fayette,PA"
c6 <- "Washington,PA"
c7 <- "Westmoreland,PA"

# Set directory for Pittsburgh MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/PIT")

# -----ALLEGHENY COUNTY-----

allegheny <- read.csv(file="allegheny_county.csv")
allegheny$FixedDate <- as.Date(allegheny$Date,format="%Y-%m-%d")
allegheny <- allegheny[-c(1:204), ]
allegheny <- allegheny[complete.cases(allegheny),]

# -----ARMSTRONG COUNTY-----

armstrong <- read.csv(file="armstrong_county.csv")
armstrong$FixedDate <- as.Date(armstrong$Date,format="%Y-%m-%d")
armstrong <- armstrong[-c(1:204), ]
armstrong <- armstrong[complete.cases(armstrong),]

# -----BEAVER COUNTY-----

beaver <- read.csv(file="beaver_county.csv")
beaver$FixedDate <- as.Date(beaver$Date,format="%Y-%m-%d")
beaver <- beaver[-c(1:204), ]
beaver <- beaver[complete.cases(beaver),]

# -----BUTLER COUNTY-----

butler <- read.csv(file="butler_county.csv")
butler$FixedDate <- as.Date(butler$Date,format="%Y-%m-%d")
butler <- butler[-c(1:204), ]
butler <- butler[complete.cases(butler),]

# -----FAYETTE COUNTY-----

fayette <- read.csv(file="fayette_county.csv")
fayette$FixedDate <- as.Date(fayette$Date,format="%Y-%m-%d")
fayette <- fayette[-c(1:204), ]
fayette <- fayette[complete.cases(fayette),]

# -----WASHINGTON COUNTY-----

washington <- read.csv(file="washington_county.csv")
washington$FixedDate <- as.Date(washington$Date,format="%Y-%m-%d")
washington <- washington[-c(1:204), ]
washington <- washington[complete.cases(washington),]

# -----WESTMORELAND COUNTY-----

westmoreland <- read.csv(file="westmoreland_county.csv")
westmoreland$FixedDate <- as.Date(westmoreland$Date,format="%Y-%m-%d")
westmoreland <- westmoreland[-c(1:204), ]
westmoreland <- westmoreland[complete.cases(westmoreland),]

# -----Data frame updates-----

northeast <- rbind(northeast, list ("Allegheny", mean(allegheny[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Armstrong", mean(armstrong[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Beaver", mean(beaver[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Butler", mean(butler[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Fayette", mean(fayette[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Washington", mean(washington[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Westmoreland", mean(westmoreland[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----NEW YORK-----

#***ALL NYC DATA NEEDS TO BE DONE FOR CITY, NOT BY BOROUGH***

# String variables for counties in New York MSA (to simplify code below)
c1 <- "New York,NY"
c2 <- "Westchester,NY"
c3 <- "Bergen,NJ"
c4 <- "Hudson,NJ"
c5 <- "Passaic,NJ"
c6 <- "Putnam,NY"
c7 <- "Rockland,NY"
c8 <- "Suffolk,NY"
c9 <- "Nassau,NY"
c10 <- "Middlesex,NJ"
c11 <- "Monmouth,NJ"
c12 <- "Ocean,NJ"
c13 <- "Somerset,NJ"
c14 <- "Essex,NJ"
c15 <- "Union,NJ"
c16 <- "Morris,NJ"
c17 <- "Sussex,NJ"
c18 <- "Hunterdon,NJ"
c19 <- "Pike,PA"

# Set directory for New York MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/NYG-NYJ")

# -----NEW YORK CITY-----

new_york <- read.csv(file="new_york_city.csv")
new_york$FixedDate <- as.Date(new_york$Date,format="%Y-%m-%d")
new_york <- new_york[-c(1:204), ]
new_york <- new_york[complete.cases(new_york),]

# -----WESTCHESTER COUNTY-----

westchester <- read.csv(file="westchester_county.csv")
westchester$FixedDate <- as.Date(westchester$Date,format="%Y-%m-%d")
westchester <- westchester[-c(1:204), ]
westchester <- westchester[complete.cases(westchester),]

# -----BERGEN COUNTY-----

bergen <- read.csv(file="bergen_county.csv")
bergen$FixedDate <- as.Date(bergen$Date,format="%Y-%m-%d")
bergen <- bergen[-c(1:204), ]
bergen <- bergen[complete.cases(bergen),]

# -----HUDSON COUNTY-----

hudson <- read.csv(file="hudson_county.csv")
hudson$FixedDate <- as.Date(hudson$Date,format="%Y-%m-%d")
hudson <- hudson[-c(1:204), ]
hudson <- hudson[complete.cases(hudson),]

# -----PASSAIC COUNTY-----

passaic <- read.csv(file="passaic_county.csv")
passaic$FixedDate <- as.Date(passaic$Date,format="%Y-%m-%d")
passaic <- passaic[-c(1:204), ]
passaic <- passaic[complete.cases(passaic),]

# -----PUTNAM COUNTY-----

putnam <- read.csv(file="putnam_county.csv")
putnam$FixedDate <- as.Date(putnam$Date,format="%Y-%m-%d")
putnam <- putnam[-c(1:204), ]
putnam <- putnam[complete.cases(putnam),]

# -----ROCKLAND COUNTY-----

rockland <- read.csv(file="rockland_county.csv")
rockland$FixedDate <- as.Date(rockland$Date,format="%Y-%m-%d")
rockland <- rockland[-c(1:204), ]
rockland <- rockland[complete.cases(rockland),]

# -----SUFFOLK COUNTY-----

suffolk_ny <- read.csv(file="suffolk_county.csv")
suffolk_ny$FixedDate <- as.Date(suffolk_ny$Date,format="%Y-%m-%d")
suffolk_ny <- suffolk_ny[-c(1:204), ]
suffolk_ny <- suffolk_ny[complete.cases(suffolk_ny),]

# -----NASSAU COUNTY-----

nassau <- read.csv(file="nassau_county.csv")
nassau$FixedDate <- as.Date(nassau$Date,format="%Y-%m-%d")
nassau <- nassau[-c(1:204), ]
nassau <- nassau[complete.cases(nassau),]

# -----MIDDLESEX COUNTY-----

middlesex_nj <- read.csv(file="middlesex_county.csv")
middlesex_nj$FixedDate <- as.Date(middlesex_nj$Date,format="%Y-%m-%d")
middlesex_nj <- middlesex_nj[-c(1:204), ]
middlesex_nj <- middlesex_nj[complete.cases(middlesex_nj),]

# -----MONMOUTH COUNTY-----

monmouth <- read.csv(file="monmouth_county.csv")
monmouth$FixedDate <- as.Date(monmouth$Date,format="%Y-%m-%d")
monmouth <- monmouth[-c(1:204), ]
monmouth <- monmouth[complete.cases(monmouth),]

# -----OCEAN COUNTY-----

ocean <- read.csv(file="ocean_county.csv")
ocean$FixedDate <- as.Date(ocean$Date,format="%Y-%m-%d")
ocean <- ocean[-c(1:204), ]
ocean <- ocean[complete.cases(ocean),]

# -----SOMERSET COUNTY-----

somerset <- read.csv(file="somerset_county.csv")
somerset$FixedDate <- as.Date(somerset$Date,format="%Y-%m-%d")
somerset <- somerset[-c(1:204), ]
somerset <- somerset[complete.cases(somerset),]

# -----ESSEX COUNTY-----

essex_nj <- read.csv(file="essex_county.csv")
essex_nj$FixedDate <- as.Date(essex_nj$Date,format="%Y-%m-%d")
essex_nj <- essex_nj[-c(1:204), ]
essex_nj <- essex_nj[complete.cases(essex_nj),]

# -----UNION COUNTY-----

union <- read.csv(file="union_county.csv")
union$FixedDate <- as.Date(union$Date,format="%Y-%m-%d")
union <- union[-c(1:204), ]
union <- union[complete.cases(union),]

# -----MORRIS COUNTY-----

morris <- read.csv(file="morris_county.csv")
morris$FixedDate <- as.Date(morris$Date,format="%Y-%m-%d")
morris <- morris[-c(1:204), ]
morris <- morris[complete.cases(morris),]

# -----SUSSEX COUNTY-----

sussex <- read.csv(file="sussex_county.csv")
sussex$FixedDate <- as.Date(sussex$Date,format="%Y-%m-%d")
sussex <- sussex[-c(1:204), ]
sussex <- sussex[complete.cases(sussex),]

# -----HUNTERDON COUNTY-----

hunterdon <- read.csv(file="hunterdon_county.csv")
hunterdon$FixedDate <- as.Date(hunterdon$Date,format="%Y-%m-%d")
hunterdon <- hunterdon[-c(1:204), ]
hunterdon <- hunterdon[complete.cases(hunterdon),]

# -----PIKE COUNTY-----

pike <- read.csv(file="pike_county.csv")
pike$FixedDate <- as.Date(pike$Date,format="%Y-%m-%d")
pike <- pike[-c(1:204), ]
pike <- pike[complete.cases(pike),]

# -----Data frame updates-----

# Aggregate NYC data: Rt is citywide but demographic info is split up by borough

northeast <- rbind(northeast, list ("New York City", mean(new_york[,"Rt"]),
                    0.131,
                    2.42,
                    27755.3,
                    0.212,
                    0.228,
                    0.5140122,
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Westchester", mean(westchester[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Bergen", mean(bergen[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Hudson", mean(hudson[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Passaic", mean(passaic[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Putnam", mean(putnam[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Rockland", mean(rockland[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Suffolk (NY)", mean(suffolk_ny[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Nassau", mean(nassau[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Middlesex (NJ)", mean(middlesex_nj[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Monmouth", mean(monmouth[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Ocean", mean(ocean[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Somerset", mean(somerset[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Essex (NJ)", mean(essex_nj[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Union", mean(union[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c15],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c15],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c15],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c15],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c15],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c15] + county.data$PER_HIS[county.data$COUNTY_ABBR==c15]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Morris", mean(morris[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c16],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c16],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c16],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c16],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c16],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c16] + county.data$PER_HIS[county.data$COUNTY_ABBR==c16]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Sussex", mean(sussex[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c17],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c17],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c17],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c17],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c17],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c17] + county.data$PER_HIS[county.data$COUNTY_ABBR==c17]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Hunterdon", mean(hunterdon[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c18],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c18],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c18],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c18],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c18],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c18] + county.data$PER_HIS[county.data$COUNTY_ABBR==c18]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Pike", mean(pike[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c19],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c19],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c19],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c19],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c19],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c19] + county.data$PER_HIS[county.data$COUNTY_ABBR==c19]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                    mask.data$MANDATE[mask.data$COUNTY==c3]))

# -----BUFFALO-----

# String variables for counties in Buffalo MSA (to simplify code below)
c1 <- "Erie,NY"
c2 <- "Niagara,NY"

# Set directory for Buffalo MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/BUF")

# -----ERIE COUNTY-----

erie <- read.csv(file="erie_county.csv")
erie$FixedDate <- as.Date(erie$Date,format="%Y-%m-%d")
erie <- erie[-c(1:204), ]
erie <- erie[complete.cases(erie),]

# -----NIAGARA COUNTY-----

niagara <- read.csv(file="niagara_county.csv")
niagara$FixedDate <- as.Date(niagara$Date,format="%Y-%m-%d")
niagara <- niagara[-c(1:204), ]
niagara <- niagara[complete.cases(niagara),]

# -----Data frame updates-----

northeast <- rbind(northeast, list ("Erie", mean(erie[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Niagara", mean(niagara[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----NEW ENGLAND-----

# String variables for counties in Boston MSA (to simplify code below)
c1 <- "Norfolk,MA"
c2 <- "Plymouth,MA"
c3 <- "Suffolk,MA"
c4 <- "Essex,MA"
c5 <- "Middlesex,MA"
c6 <- "Rockingham,NH"
c7 <- "Strafford,NH"

# Set directory for Boston MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/NE")

# -----NORFOLK COUNTY-----

norfolk <- read.csv(file="norfolk_county.csv")
norfolk$FixedDate <- as.Date(norfolk$Date,format="%Y-%m-%d")
norfolk <- norfolk[-c(1:204), ]
norfolk <- norfolk[complete.cases(norfolk),]

# -----PLYMOUTH COUNTY-----

plymouth <- read.csv(file="plymouth_county.csv")
plymouth$FixedDate <- as.Date(plymouth$Date,format="%Y-%m-%d")
plymouth <- plymouth[-c(1:204), ]
plymouth <- plymouth[complete.cases(plymouth),]

# -----SUFFOLK COUNTY-----

suffolk_ma <- read.csv(file="suffolk_county.csv")
suffolk_ma$FixedDate <- as.Date(suffolk_ma$Date,format="%Y-%m-%d")
suffolk_ma <- suffolk_ma[-c(1:204), ]
suffolk_ma <- suffolk_ma[complete.cases(suffolk_ma),]

# -----ESSEX COUNTY-----

essex_ma <- read.csv(file="essex_county.csv")
essex_ma$FixedDate <- as.Date(essex_ma$Date,format="%Y-%m-%d")
essex_ma <- essex_ma[-c(1:204), ]
essex_ma <- essex_ma[complete.cases(essex_ma),]

# -----MIDDLESEX COUNTY-----

middlesex_ma <- read.csv(file="middlesex_county.csv")
middlesex_ma$FixedDate <- as.Date(middlesex_ma$Date,format="%Y-%m-%d")
middlesex_ma <- middlesex_ma[-c(1:204), ]
middlesex_ma <- middlesex_ma[complete.cases(middlesex_ma),]

# -----ROCKINGHAM COUNTY-----

rockingham <- read.csv(file="rockingham_county.csv")
rockingham$FixedDate <- as.Date(rockingham$Date,format="%Y-%m-%d")
rockingham <- rockingham[-c(1:204), ]
rockingham <- rockingham[complete.cases(rockingham),]

# -----STRAFFORD COUNTY-----

strafford <- read.csv(file="strafford_county.csv")
strafford$FixedDate <- as.Date(strafford$Date,format="%Y-%m-%d")
strafford <- strafford[-c(1:204), ]
strafford <- strafford[complete.cases(strafford),]

# -----Data frame updates-----

northeast <- rbind(northeast, list ("Norfolk", mean(norfolk[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Plymouth", mean(plymouth[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Suffolk (MA)", mean(suffolk_ma[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Essex (MA)", mean(essex_ma[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Middlesex (MA)", mean(middlesex_ma[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Rockingham", mean(rockingham[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

northeast <- rbind(northeast, list ("Strafford", mean(strafford[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----BALTIMORE-----

# String variables for counties in Baltimore MSA (to simplify code below)
c1 <- "Anne Arundel,MD"
c2 <- "Baltimore,MD"
c3 <- "Baltimore city,MD"
c4 <- "Carroll,MD"
c5 <- "Harford,MD"
c6 <- "Howard,MD"
c7 <- "Queen Anne's,MD"

# Set directory for Baltimore MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/BAL")

# -----ANNE ARUNDEL COUNTY-----

anne_arundel <- read.csv(file="anne_arundel_county.csv")
anne_arundel$FixedDate <- as.Date(anne_arundel$Date,format="%Y-%m-%d")
anne_arundel <- anne_arundel[-c(1:204), ]
anne_arundel <- anne_arundel[complete.cases(anne_arundel),]

# -----BALTIMORE COUNTY-----

baltimore <- read.csv(file="baltimore_county.csv")
baltimore$FixedDate <- as.Date(baltimore$Date,format="%Y-%m-%d")
baltimore <- baltimore[-c(1:204), ]
baltimore <- baltimore[complete.cases(baltimore),]

# -----BALTIMORE CITY-----

baltimore_city <- read.csv(file="baltimore_city.csv")
baltimore_city$FixedDate <- as.Date(baltimore_city$Date,format="%Y-%m-%d")
baltimore_city <- baltimore_city[-c(1:204), ]
baltimore_city <- baltimore_city[complete.cases(baltimore_city),]

# -----CARROLL COUNTY-----

carroll_md <- read.csv(file="carroll_county.csv")
carroll_md$FixedDate <- as.Date(carroll_md$Date,format="%Y-%m-%d")
carroll_md <- carroll_md[-c(1:204), ]
carroll_md <- carroll_md[complete.cases(carroll_md),]

# -----HARFORD COUNTY-----

harford <- read.csv(file="harford_county.csv")
harford$FixedDate <- as.Date(harford$Date,format="%Y-%m-%d")
harford <- harford[-c(1:204), ]
harford <- harford[complete.cases(harford),]

# -----HOWARD COUNTY-----

howard <- read.csv(file="howard_county.csv")
howard$FixedDate <- as.Date(howard$Date,format="%Y-%m-%d")
howard <- howard[-c(1:204), ]
howard <- howard[complete.cases(howard),]

# -----QUEEN ANNE'S COUNTY-----

queen_annes <- read.csv(file="queen_annes_county.csv")
queen_annes$FixedDate <- as.Date(queen_annes$Date,format="%Y-%m-%d")
queen_annes <- queen_annes[-c(1:204), ]
queen_annes <- queen_annes[complete.cases(queen_annes),]

# -----Data frame updates-----

northeast <- rbind(northeast, list ("Anne Arundel", mean(anne_arundel[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Baltimore", mean(baltimore[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Baltimore City", mean(baltimore_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Carroll (MD)", mean(carroll_md[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Harford", mean(harford[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Howard", mean(howard[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

northeast <- rbind(northeast, list ("Queen Anne's", mean(queen_annes[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

# -----WASHINGTON-----

# String variables for counties in D.C. MSA (to simplify code below)
c1 <- "District of Columbia,DC"
c2 <- "Calvert,MD"
c3 <- "Charles,MD"
c4 <- "Frederick,MD"
c5 <- "Montgomery,MD"
c6 <- "Prince George's,MD"
c7 <- "Alexandria city,VA"
c8 <- "Arlington,VA"
c9 <- "Clarke,VA"
c10 <- "Culpeper,VA"
c11 <- "Fairfax,VA"
c12 <- "Fairfax city,VA"
c13 <- "Falls Church city,VA"
c14 <- "Fauquier,VA"
c15 <- "Fredericksburg city,VA"
c16 <- "Loudoun,VA"
c17 <- "Manassas city,VA"
c18 <- "Manassas Park city,VA"
c19 <- "Prince William,VA"
c20 <- "Rappahannock,VA"
c21 <- "Spotsylvania,VA"
c22 <- "Stafford,VA"
c23 <- "Warren,VA"
c24 <- "Jefferson,WV"

# Set directory for D.C. MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/WSH")

# -----WASHINGTON, D.C.-----

dc <- read.csv(file="district_of_columbia.csv")
dc$FixedDate <- as.Date(dc$Date,format="%Y-%m-%d")
dc <- dc[-c(1:204), ]
dc <- dc[complete.cases(dc),]

# -----CALVERT COUNTY-----

calvert <- read.csv(file="calvert_county.csv")
calvert$FixedDate <- as.Date(calvert$Date,format="%Y-%m-%d")
calvert <- calvert[-c(1:204), ]
calvert <- calvert[complete.cases(calvert),]

# -----CHARLES COUNTY-----

charles <- read.csv(file="charles_county.csv")
charles$FixedDate <- as.Date(charles$Date,format="%Y-%m-%d")
charles <- charles[-c(1:204), ]
charles <- charles[complete.cases(charles),]

# -----FREDERICK COUNTY-----

frederick <- read.csv(file="frederick_county.csv")
frederick$FixedDate <- as.Date(frederick$Date,format="%Y-%m-%d")
frederick <- frederick[-c(1:204), ]
frederick <- frederick[complete.cases(frederick),]

# -----MONTGOMERY COUNTY-----

montgomery_md <- read.csv(file="montgomery_county.csv")
montgomery_md$FixedDate <- as.Date(montgomery_md$Date,format="%Y-%m-%d")
montgomery_md <- montgomery_md[-c(1:204), ]
montgomery_md <- montgomery_md[complete.cases(montgomery_md),]

# -----PRINCE GEORGE'S COUNTY-----

pg <- read.csv(file="prince_georges_county.csv")
pg$FixedDate <- as.Date(pg$Date,format="%Y-%m-%d")
pg <- pg[-c(1:204), ]
pg <- pg[complete.cases(pg),]

# -----ALEXANDRIA CITY-----

alexandria_city <- read.csv(file="alexandria_city.csv")
alexandria_city$FixedDate <- as.Date(alexandria_city$Date,format="%Y-%m-%d")
alexandria_city <- alexandria_city[-c(1:204), ]
alexandria_city <- alexandria_city[complete.cases(alexandria_city),]

# -----ARLINGTON COUNTY-----

arlington <- read.csv(file="arlington_county.csv")
arlington$FixedDate <- as.Date(arlington$Date,format="%Y-%m-%d")
arlington <- arlington[-c(1:204), ]
arlington <- arlington[complete.cases(arlington),]

# -----CLARKE COUNTY-----

clarke <- read.csv(file="clarke_county.csv")
clarke$FixedDate <- as.Date(clarke$Date,format="%Y-%m-%d")
clarke <- clarke[-c(1:204), ]
clarke <- clarke[complete.cases(clarke),]

# -----CULPEPER COUNTY-----

culpeper <- read.csv(file="culpeper_county.csv")
culpeper$FixedDate <- as.Date(culpeper$Date,format="%Y-%m-%d")
culpeper <- culpeper[-c(1:204), ]
culpeper <- culpeper[complete.cases(culpeper),]

# -----FAIRFAX COUNTY-----

fairfax <- read.csv(file="fairfax_county.csv")
fairfax$FixedDate <- as.Date(fairfax$Date,format="%Y-%m-%d")
fairfax <- fairfax[-c(1:204), ]
fairfax <- fairfax[complete.cases(fairfax),]

# -----FAIRFAX CITY-----

fairfax_city <- read.csv(file="fairfax_city.csv")
fairfax_city$FixedDate <- as.Date(fairfax_city$Date,format="%Y-%m-%d")
fairfax_city <- fairfax_city[-c(1:204), ]
fairfax_city <- fairfax_city[complete.cases(fairfax_city),]

# -----FALLS CHURCH CITY-----

falls_church_city <- read.csv(file="falls_church_city.csv")
falls_church_city$FixedDate <- as.Date(falls_church_city$Date,format="%Y-%m-%d")
falls_church_city <- falls_church_city[-c(1:204), ]
falls_church_city <- falls_church_city[complete.cases(falls_church_city),]

# -----FAUQUIER COUNTY-----

fauquier <- read.csv(file="fauquier_county.csv")
fauquier$FixedDate <- as.Date(fauquier$Date,format="%Y-%m-%d")
fauquier <- fauquier[-c(1:204), ]
fauquier <- fauquier[complete.cases(fauquier),]

# -----FREDERICKSBURG CITY-----

fredericksburg_city <- read.csv(file="fredericksburg_city.csv")
fredericksburg_city$FixedDate <- as.Date(fredericksburg_city$Date,format="%Y-%m-%d")
fredericksburg_city <- fredericksburg_city[-c(1:204), ]
fredericksburg_city <- fredericksburg_city[complete.cases(fredericksburg_city),]

# -----LOUDOUN COUNTY-----

loudoun <- read.csv(file="loudoun_county.csv")
loudoun$FixedDate <- as.Date(loudoun$Date,format="%Y-%m-%d")
loudoun <- loudoun[-c(1:204), ]
loudoun <- loudoun[complete.cases(loudoun),]

# -----MANASSAS CITY-----

manassas_city <- read.csv(file="manassas_city.csv")
manassas_city$FixedDate <- as.Date(manassas_city$Date,format="%Y-%m-%d")
manassas_city <- manassas_city[-c(1:204), ]
manassas_city <- manassas_city[complete.cases(manassas_city),]

# -----MANASSAS PARK CITY-----

manassas_park_city <- read.csv(file="manassas_park_city.csv")
manassas_park_city$FixedDate <- as.Date(manassas_park_city$Date,format="%Y-%m-%d")
manassas_park_city <- manassas_park_city[-c(1:204), ]
manassas_park_city <- manassas_park_city[complete.cases(manassas_park_city),]

# -----PRINCE WILLIAM COUNTY-----

prince_william <- read.csv(file="prince_william_county.csv")
prince_william$FixedDate <- as.Date(prince_william$Date,format="%Y-%m-%d")
prince_william <- prince_william[-c(1:204), ]
prince_william <- prince_william[complete.cases(prince_william),]

# -----RAPPAHANNOCK COUNTY-----

rappahannock <- read.csv(file="rappahannock_county.csv")
rappahannock$FixedDate <- as.Date(rappahannock$Date,format="%Y-%m-%d")
rappahannock <- rappahannock[-c(1:204), ]
rappahannock <- rappahannock[complete.cases(rappahannock),]

# -----SPOTSYLVANIA COUNTY-----

spotsylvania <- read.csv(file="spotsylvania_county.csv")
spotsylvania$FixedDate <- as.Date(spotsylvania$Date,format="%Y-%m-%d")
spotsylvania <- spotsylvania[-c(1:204), ]
spotsylvania <- spotsylvania[complete.cases(spotsylvania),]

# -----STAFFORD COUNTY-----

stafford <- read.csv(file="stafford_county.csv")
stafford$FixedDate <- as.Date(stafford$Date,format="%Y-%m-%d")
stafford <- stafford[-c(1:204), ]
stafford <- stafford[complete.cases(stafford),]

# -----WARREN COUNTY-----

warren <- read.csv(file="warren_county.csv")
warren$FixedDate <- as.Date(warren$Date,format="%Y-%m-%d")
warren <- warren[-c(1:204), ]
warren <- warren[complete.cases(warren),]

# -----JEFFERSON COUNTY-----

jefferson <- read.csv(file="jefferson_county.csv")
jefferson$FixedDate <- as.Date(jefferson$Date,format="%Y-%m-%d")
jefferson <- jefferson[-c(1:204), ]
jefferson <- jefferson[complete.cases(jefferson),]

# -----Data frame updates-----

northeast <- rbind(northeast, list ("Washington, D.C.", mean(dc[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Calvert", mean(calvert[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Charles", mean(charles[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Frederick", mean(frederick[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Montgomery (MD)", mean(montgomery_md[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Prince George's", mean(pg[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Alexandria city", mean(alexandria_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Arlington", mean(arlington[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Clarke", mean(clarke[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Culpeper", mean(culpeper[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Fairfax", mean(fairfax[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Fairfax city", mean(fairfax_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Falls Church city", mean(falls_church_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Fauquier", mean(fauquier[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Fredericksburg city", mean(fredericksburg_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c15],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c15],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c15],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c15],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c15],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c15] + county.data$PER_HIS[county.data$COUNTY_ABBR==c15]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Loudoun", mean(loudoun[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c16],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c16],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c16],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c16],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c16],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c16] + county.data$PER_HIS[county.data$COUNTY_ABBR==c16]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Manassas city", mean(manassas_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c17],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c17],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c17],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c17],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c17],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c17] + county.data$PER_HIS[county.data$COUNTY_ABBR==c17]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Manassas Park city", mean(manassas_park_city[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c18],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c18],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c18],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c18],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c18],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c18] + county.data$PER_HIS[county.data$COUNTY_ABBR==c18]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Prince William", mean(prince_william[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c19],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c19],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c19],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c19],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c19],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c19] + county.data$PER_HIS[county.data$COUNTY_ABBR==c19]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Rappahannock", mean(rappahannock[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c20],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c20],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c20],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c20],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c20],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c20] + county.data$PER_HIS[county.data$COUNTY_ABBR==c20]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Spotsylvania", mean(spotsylvania[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c21],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c21],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c21],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c21],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c21],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c21] + county.data$PER_HIS[county.data$COUNTY_ABBR==c21]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Stafford", mean(stafford[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c22],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c22],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c22],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c22],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c22],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c22] + county.data$PER_HIS[county.data$COUNTY_ABBR==c22]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Warren", mean(warren[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c23],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c23],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c23],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c23],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c23],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c23] + county.data$PER_HIS[county.data$COUNTY_ABBR==c23]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

northeast <- rbind(northeast, list ("Jefferson", mean(jefferson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c24],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c24],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c24],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c24],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c24],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c24] + county.data$PER_HIS[county.data$COUNTY_ABBR==c24]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                            mask.data$MANDATE[mask.data$COUNTY==c6]))

#ne_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke, data=northeast)
#ne_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + No_Fans + Under_Ten, data=northeast)
ne_fit <- lm(Rt ~ No_Fans + Under_Ten, data=northeast)
summary(ne_fit)
#boxplot(ne_fit[['residuals']],main='Boxplot: Residuals',ylab='residual value')