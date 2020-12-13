# Import county data
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files")
county.data <- read.csv(file="county_demo_health.csv")
voting.data <- read.csv(file="voting by county.csv")
stadium.data <- read.csv(file="games with fans-wk 4.csv")
mask.data <- read.csv(file="mask mandates.csv")
Rt.data <- read.csv(file="rt_table_export.csv")

# -----DALLAS-----

# String variables for counties in Dallas MSA (to simplify code below)
c1 <- "Collin,TX"
c2 <- "Dallas,TX"
c3 <- "Denton,TX"
c4 <- "Ellis,TX"
c5 <- "Hunt,TX"
c6 <- "Kaufman,TX"
c7 <- "Rockwall,TX"
c8 <- "Johnson,TX"
c9 <- "Parker,TX"
c10 <- "Tarrant,TX"
c11 <- "Wise,TX"

# Set directory for Dallas MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/DAL")

# -----COLLIN COUNTY-----

collin <- read.csv(file="collin_county.csv")
collin$FixedDate <- as.Date(collin$Date,format="%Y-%m-%d")
collin <- collin[-c(1:204), ]
collin <- collin[complete.cases(collin),]

# -----DALLAS COUNTY-----

dallas <- read.csv(file="dallas_county.csv")
dallas$FixedDate <- as.Date(dallas$Date,format="%Y-%m-%d")
dallas <- dallas[-c(1:204), ]
dallas <- dallas[complete.cases(dallas),]

# -----DENTON COUNTY-----

denton <- read.csv(file="denton_county.csv")
denton$FixedDate <- as.Date(denton$Date,format="%Y-%m-%d")
denton <- denton[-c(1:204), ]
denton <- denton[complete.cases(denton),]

# -----ELLIS COUNTY-----

ellis <- read.csv(file="ellis_county.csv")
ellis$FixedDate <- as.Date(ellis$Date,format="%Y-%m-%d")
ellis <- ellis[-c(1:204), ]
ellis <- ellis[complete.cases(ellis),]

# -----HUNT COUNTY-----

hunt <- read.csv(file="hunt_county.csv")
hunt$FixedDate <- as.Date(hunt$Date,format="%Y-%m-%d")
hunt <- hunt[-c(1:204), ]
hunt <- hunt[complete.cases(hunt),]

# -----KAUFMAN COUNTY-----

kaufman <- read.csv(file="kaufman_county.csv")
kaufman$FixedDate <- as.Date(kaufman$Date,format="%Y-%m-%d")
kaufman <- kaufman[-c(1:204), ]
kaufman <- kaufman[complete.cases(kaufman),]

# -----ROCKWALL COUNTY-----

rockwall <- read.csv(file="rockwall_county.csv")
rockwall$FixedDate <- as.Date(rockwall$Date,format="%Y-%m-%d")
rockwall <- rockwall[-c(1:204), ]
rockwall <- rockwall[complete.cases(rockwall),]

# -----JOHNSON COUNTY-----

johnson <- read.csv(file="johnson_county.csv")
johnson$FixedDate <- as.Date(johnson$Date,format="%Y-%m-%d")
johnson <- johnson[-c(1:204), ]
johnson <- johnson[complete.cases(johnson),]

# -----PARKER COUNTY-----

parker <- read.csv(file="parker_county.csv")
parker$FixedDate <- as.Date(parker$Date,format="%Y-%m-%d")
parker <- parker[-c(1:204), ]
parker <- parker[complete.cases(parker),]

# -----TARRANT COUNTY-----

tarrant <- read.csv(file="tarrant_county.csv")
tarrant$FixedDate <- as.Date(tarrant$Date,format="%Y-%m-%d")
tarrant <- tarrant[-c(1:204), ]
tarrant <- tarrant[complete.cases(tarrant),]

# -----WISE COUNTY-----

wise <- read.csv(file="wise_county.csv")
wise$FixedDate <- as.Date(wise$Date,format="%Y-%m-%d")
wise <- wise[-c(1:204), ]
wise <- wise[complete.cases(wise),]

# -----Data frame updates-----

south <- data.frame("County" = "Collin", "Rt" = mean(collin[,"Rt"]),
                "Smoke" = county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                "Household" = county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                "Density" = county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                "College" = county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                "R_Voting" = voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                "Black_His" = (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                "No_Fans" = stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                "Under_Ten" = stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                "Ten_to_Twenty" = stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                "Over_Twenty" = stadium.data$OVER_20[stadium.data$COUNTY==c10],
                "Mask" = mask.data$MANDATE[mask.data$COUNTY==c10])

south <- rbind(south, list ("Dallas", mean(dallas[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Denton", mean(denton[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Ellis", mean(ellis[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Hunt", mean(hunt[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Kaufman", mean(kaufman[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Rockwall", mean(rockwall[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Johnson", mean(johnson[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Parker", mean(parker[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Tarrant", mean(tarrant[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

south <- rbind(south, list ("Wise", mean(wise[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c10],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c10],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c10],
                    stadium.data$OVER_20[stadium.data$COUNTY==c10],
                    mask.data$MANDATE[mask.data$COUNTY==c10]))

# -----HOUSTON-----

# String variables for counties in Houston MSA (to simplify code below)
c1 <- "Austin,TX"
c2 <- "Brazoria,TX"
c3 <- "Chambers,TX"
c4 <- "Fort Bend,TX"
c5 <- "Galveston,TX"
c6 <- "Harris,TX"
c7 <- "Liberty,TX"
c8 <- "Montgomery,TX"
c9 <- "Waller,TX"

# Set directory for Houston MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/HOU")

# -----AUSTIN COUNTY-----

austin <- read.csv(file="austin_county.csv")
austin$FixedDate <- as.Date(austin$Date,format="%Y-%m-%d")
austin <- austin[-c(1:204), ]
austin <- austin[complete.cases(austin),]

# -----BRAZORIA COUNTY-----

brazoria <- read.csv(file="brazoria_county.csv")
brazoria$FixedDate <- as.Date(brazoria$Date,format="%Y-%m-%d")
brazoria <- brazoria[-c(1:204), ]
brazoria <- brazoria[complete.cases(brazoria),]

# -----CHAMBERS COUNTY-----

chambers <- read.csv(file="chambers_county.csv")
chambers$FixedDate <- as.Date(chambers$Date,format="%Y-%m-%d")
chambers <- chambers[-c(1:204), ]
chambers <- chambers[complete.cases(chambers),]

# -----FORT BEND COUNTY-----

fort_bend <- read.csv(file="fort_bend_county.csv")
fort_bend$FixedDate <- as.Date(fort_bend$Date,format="%Y-%m-%d")
fort_bend <- fort_bend[-c(1:204), ]
fort_bend <- fort_bend[complete.cases(fort_bend),]

# -----GALVESTON COUNTY-----

galveston <- read.csv(file="galveston_county.csv")
galveston$FixedDate <- as.Date(galveston$Date,format="%Y-%m-%d")
galveston <- galveston[-c(1:204), ]
galveston <- galveston[complete.cases(galveston),]

# -----HARRIS COUNTY-----

harris <- read.csv(file="harris_county.csv")
harris$FixedDate <- as.Date(harris$Date,format="%Y-%m-%d")
harris <- harris[-c(1:204), ]
harris <- harris[complete.cases(harris),]

# -----LIBERTY COUNTY-----

liberty <- read.csv(file="liberty_county.csv")
liberty$FixedDate <- as.Date(liberty$Date,format="%Y-%m-%d")
liberty <- liberty[-c(1:204), ]
liberty <- liberty[complete.cases(liberty),]

# -----MONTGOMERY COUNTY-----

montgomery_tx <- read.csv(file="montgomery_county.csv")
montgomery_tx$FixedDate <- as.Date(montgomery_tx$Date,format="%Y-%m-%d")
montgomery_tx <- montgomery_tx[-c(1:204), ]
montgomery_tx <- montgomery_tx[complete.cases(montgomery_tx),]

# -----WALLER COUNTY-----

waller <- read.csv(file="waller_county.csv")
waller$FixedDate <- as.Date(waller$Date,format="%Y-%m-%d")
waller <- waller[-c(1:204), ]
waller <- waller[complete.cases(waller),]

# -----Data frame updates-----

south <- rbind(south, list ("Austin", mean(austin[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Brazoria", mean(brazoria[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Chambers", mean(chambers[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Fort Bend", mean(fort_bend[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Galveston", mean(galveston[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Harris", mean(harris[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Liberty", mean(liberty[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Montgomery (TX)", mean(montgomery_tx[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

south <- rbind(south, list ("Waller", mean(waller[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c6],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c6],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c6],
                    stadium.data$OVER_20[stadium.data$COUNTY==c6],
                    mask.data$MANDATE[mask.data$COUNTY==c6]))

# -----NEW ORLEANS-----

# String variables for parishes in New Orleans MSA (to simplify code below)
c1 <- "Jefferson Parish,LA"
c2 <- "Orleans Parish,LA"
c3 <- "Plaquemines Parish,LA"
c4 <- "St. Bernard Parish,LA"
c5 <- "St. Charles Parish,LA"
c6 <- "St. John the Baptist Parish,LA"
c7 <- "St. Tammany Parish,LA"
c8 <- "St. James Parish,LA"

# Set directory for New Orleans MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/NO")

# -----JEFFERSON PARISH-----

jefferson <- read.csv(file="jefferson_parish.csv")
jefferson$FixedDate <- as.Date(jefferson$Date,format="%Y-%m-%d")
jefferson <- jefferson[-c(1:204), ]
jefferson <- jefferson[complete.cases(jefferson),]

# -----ORLEANS PARISH-----

orleans <- read.csv(file="orleans_parish.csv")
orleans$FixedDate <- as.Date(orleans$Date,format="%Y-%m-%d")
orleans <- orleans[-c(1:204), ]
orleans <- orleans[complete.cases(orleans),]

# -----PLAQUEMINES PARISH-----

plaquemines <- read.csv(file="plaquemines_parish.csv")
plaquemines$FixedDate <- as.Date(plaquemines$Date,format="%Y-%m-%d")
plaquemines <- plaquemines[-c(1:204), ]
plaquemines <- plaquemines[complete.cases(plaquemines),]

# -----ST. BERNARD PARISH-----

st_bernard <- read.csv(file="st_bernard_parish.csv")
st_bernard$FixedDate <- as.Date(st_bernard$Date,format="%Y-%m-%d")
st_bernard <- st_bernard[-c(1:204), ]
st_bernard <- st_bernard[complete.cases(st_bernard),]

# -----ST. CHARLES PARISH-----

st_charles <- read.csv(file="st_charles_parish.csv")
st_charles$FixedDate <- as.Date(st_charles$Date,format="%Y-%m-%d")
st_charles <- st_charles[-c(1:204), ]
st_charles <- st_charles[complete.cases(st_charles),]

# -----ST. JOHN THE BAPTIST PARISH-----

st_john_the_baptist <- read.csv(file="st_john_the_baptist_parish.csv")
st_john_the_baptist$FixedDate <- as.Date(st_john_the_baptist$Date,format="%Y-%m-%d")
st_john_the_baptist <- st_john_the_baptist[-c(1:204), ]
st_john_the_baptist <- st_john_the_baptist[complete.cases(st_john_the_baptist),]

# -----ST. TAMMANY PARISH-----

st_tammany <- read.csv(file="st_tammany_parish.csv")
st_tammany$FixedDate <- as.Date(st_tammany$Date,format="%Y-%m-%d")
st_tammany <- st_tammany[-c(1:204), ]
st_tammany <- st_tammany[complete.cases(st_tammany),]

# -----ST. JAMES PARISH-----

st_james <- read.csv(file="st_james_parish.csv")
st_james$FixedDate <- as.Date(st_james$Date,format="%Y-%m-%d")
st_james <- st_james[-c(1:204), ]
st_james <- st_james[complete.cases(st_james),]

# -----Data frame updates-----

south <- rbind(south, list ("Jefferson", mean(jefferson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("Orleans", mean(orleans[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("Plaquemines", mean(plaquemines[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("St. Bernard", mean(st_bernard[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("St. Charles", mean(st_charles[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("St. John the Baptist", mean(st_john_the_baptist[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("St. Tammany", mean(st_tammany[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

south <- rbind(south, list ("St. James", mean(st_james[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c2],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c2],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c2],
                            stadium.data$OVER_20[stadium.data$COUNTY==c2],
                            mask.data$MANDATE[mask.data$COUNTY==c2]))

# -----TENNESSEE-----

# String variables for counties in Nashville MSA (to simplify code below)
c1 <- "Cannon,TN"
c2 <- "Cheatham,TN"
c3 <- "Davidson,TN"
c4 <- "Dickson,TN"
c5 <- "Hickman,TN"
c6 <- "Macon,TN"
c7 <- "Maury,TN"
c8 <- "Robertson,TN"
c9 <- "Rutherford,TN"
c10 <- "Smith,TN"
c11 <- "Sumner,TN"
c12 <- "Trousdale,TN"
c13 <- "Williamson,TN"
c14 <- "Wilson,TN"

# Set directory for Nashville MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/TEN")

# -----CANNON COUNTY-----

cannon <- read.csv(file="cannon_county.csv")
cannon$FixedDate <- as.Date(cannon$Date,format="%Y-%m-%d")
cannon <- cannon[-c(1:204), ]
cannon <- cannon[complete.cases(cannon),]

# -----CHEATHAM COUNTY-----

cheatham <- read.csv(file="cheatham_county.csv")
cheatham$FixedDate <- as.Date(cheatham$Date,format="%Y-%m-%d")
cheatham <- cheatham[-c(1:204), ]
cheatham <- cheatham[complete.cases(cheatham),]

# -----DAVIDSON COUNTY-----

davidson <- read.csv(file="davidson_county.csv")
davidson$FixedDate <- as.Date(davidson$Date,format="%Y-%m-%d")
davidson <- davidson[-c(1:204), ]
davidson <- davidson[complete.cases(davidson),]

# -----DICKSON COUNTY-----

dickson <- read.csv(file="dickson_county.csv")
dickson$FixedDate <- as.Date(dickson$Date,format="%Y-%m-%d")
dickson <- dickson[-c(1:204), ]
dickson <- dickson[complete.cases(dickson),]

# -----HICKMAN COUNTY-----

hickman <- read.csv(file="hickman_county.csv")
hickman$FixedDate <- as.Date(hickman$Date,format="%Y-%m-%d")
hickman <- hickman[-c(1:204), ]
hickman <- hickman[complete.cases(hickman),]

# -----MACON COUNTY-----

macon <- read.csv(file="macon_county.csv")
macon$FixedDate <- as.Date(macon$Date,format="%Y-%m-%d")
macon <- macon[-c(1:204), ]
macon <- macon[complete.cases(macon),]

# -----MAURY COUNTY-----

maury <- read.csv(file="maury_county.csv")
maury$FixedDate <- as.Date(maury$Date,format="%Y-%m-%d")
maury <- maury[-c(1:204), ]
maury <- maury[complete.cases(maury),]

# -----ROBERTSON COUNTY-----

robertson <- read.csv(file="robertson_county.csv")
robertson$FixedDate <- as.Date(robertson$Date,format="%Y-%m-%d")
robertson <- robertson[-c(1:204), ]
robertson <- robertson[complete.cases(robertson),]

# -----RUTHERFORD COUNTY-----

rutherford <- read.csv(file="rutherford_county.csv")
rutherford$FixedDate <- as.Date(rutherford$Date,format="%Y-%m-%d")
rutherford <- rutherford[-c(1:204), ]
rutherford <- rutherford[complete.cases(rutherford),]

# -----SMITH COUNTY-----

smith <- read.csv(file="smith_county.csv")
smith$FixedDate <- as.Date(smith$Date,format="%Y-%m-%d")
smith <- smith[-c(1:204), ]
smith <- smith[complete.cases(smith),]

# -----SUMNER COUNTY-----

sumner <- read.csv(file="sumner_county.csv")
sumner$FixedDate <- as.Date(sumner$Date,format="%Y-%m-%d")
sumner <- sumner[-c(1:204), ]
sumner <- sumner[complete.cases(sumner),]

# -----TROUSDALE COUNTY-----

trousdale <- read.csv(file="trousdale_county.csv")
trousdale$FixedDate <- as.Date(trousdale$Date,format="%Y-%m-%d")
trousdale <- trousdale[-c(1:204), ]
trousdale <- trousdale[complete.cases(trousdale),]

# -----WILLIAMSON COUNTY-----

williamson <- read.csv(file="williamson_county.csv")
williamson$FixedDate <- as.Date(williamson$Date,format="%Y-%m-%d")
williamson <- williamson[-c(1:204), ]
williamson <- williamson[complete.cases(williamson),]

# -----WILSON COUNTY-----

wilson <- read.csv(file="wilson_county.csv")
wilson$FixedDate <- as.Date(wilson$Date,format="%Y-%m-%d")
wilson <- wilson[-c(1:204), ]
wilson <- wilson[complete.cases(wilson),]

# -----Data frame updates-----

south <- rbind(south, list ("Cannon", mean(cannon[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Cheatham", mean(cheatham[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Davidson", mean(davidson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Dickson", mean(dickson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Hickman", mean(hickman[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Macon", mean(macon[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Maury", mean(maury[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Robertson", mean(robertson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Rutherford", mean(rutherford[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Smith", mean(smith[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Sumner", mean(sumner[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Trousdale", mean(trousdale[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Williamson", mean(williamson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

south <- rbind(south, list ("Wilson", mean(wilson[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c3],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c3],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c3],
                            stadium.data$OVER_20[stadium.data$COUNTY==c3],
                            mask.data$MANDATE[mask.data$COUNTY==c3]))

# -----ATLANTA-----

# String variables for counties in Atlanta MSA (to simplify code below)
c1 <- "Fulton,GA"
c2 <- "DeKalb,GA"
c3 <- "Gwinnett,GA"
c4 <- "Cobb,GA"
c5 <- "Clayton,GA"
c6 <- "Walton,GA"
c7 <- "Newton,GA"
c8 <- "Douglas,GA"
c9 <- "Fayette,GA"
c10 <- "Forsyth,GA"
c11 <- "Henry,GA"
c12 <- "Cherokee,GA"
c13 <- "Rockdale,GA"
c14 <- "Butts,GA"
c15 <- "Barrow,GA"
c16 <- "Coweta,GA"
c17 <- "Bartow,GA"
c18 <- "Carroll,GA"
c19 <- "Paulding,GA"
c20 <- "Pickens,GA"
c21 <- "Spalding,GA"

# Set directory for Atlanta MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/ATL")

# -----FULTON COUNTY-----

fulton <- read.csv(file="fulton_county.csv")
fulton$FixedDate <- as.Date(fulton$Date,format="%Y-%m-%d")
fulton <- fulton[-c(1:204), ]
fulton <- fulton[complete.cases(fulton),]

# -----DEKALB COUNTY-----

dekalb <- read.csv(file="dekalb_county.csv")
dekalb$FixedDate <- as.Date(dekalb$Date,format="%Y-%m-%d")
dekalb <- dekalb[-c(1:204), ]
dekalb <- dekalb[complete.cases(dekalb),]

# -----GWINNETT COUNTY-----

gwinnett <- read.csv(file="gwinnett_county.csv")
gwinnett$FixedDate <- as.Date(gwinnett$Date,format="%Y-%m-%d")
gwinnett <- gwinnett[-c(1:204), ]
gwinnett <- gwinnett[complete.cases(gwinnett),]

# -----COBB COUNTY-----

cobb <- read.csv(file="cobb_county.csv")
cobb$FixedDate <- as.Date(cobb$Date,format="%Y-%m-%d")
cobb <- cobb[-c(1:204), ]
cobb <- cobb[complete.cases(cobb),]

# -----CLAYTON COUNTY-----

clayton <- read.csv(file="clayton_county.csv")
clayton$FixedDate <- as.Date(clayton$Date,format="%Y-%m-%d")
clayton <- clayton[-c(1:204), ]
clayton <- clayton[complete.cases(clayton),]

# -----WALTON COUNTY-----

walton <- read.csv(file="walton_county.csv")
walton$FixedDate <- as.Date(walton$Date,format="%Y-%m-%d")
walton <- walton[-c(1:204), ]
walton <- walton[complete.cases(walton),]

# -----NEWTON COUNTY-----

newton <- read.csv(file="newton_county.csv")
newton$FixedDate <- as.Date(newton$Date,format="%Y-%m-%d")
newton <- newton[-c(1:204), ]
newton <- newton[complete.cases(newton),]

# -----DOUGLAS COUNTY-----

douglas <- read.csv(file="douglas_county.csv")
douglas$FixedDate <- as.Date(douglas$Date,format="%Y-%m-%d")
douglas <- douglas[-c(1:204), ]
douglas <- douglas[complete.cases(douglas),]

# -----FAYETTE COUNTY-----

fayette <- read.csv(file="fayette_county.csv")
fayette$FixedDate <- as.Date(fayette$Date,format="%Y-%m-%d")
fayette <- fayette[-c(1:204), ]
fayette <- fayette[complete.cases(fayette),]

# -----FORSYTH COUNTY-----

forsyth <- read.csv(file="forsyth_county.csv")
forsyth$FixedDate <- as.Date(forsyth$Date,format="%Y-%m-%d")
forsyth <- forsyth[-c(1:204), ]
forsyth <- forsyth[complete.cases(forsyth),]

# -----HENRY COUNTY-----

henry <- read.csv(file="henry_county.csv")
henry$FixedDate <- as.Date(henry$Date,format="%Y-%m-%d")
henry <- henry[-c(1:204), ]
henry <- henry[complete.cases(henry),]

# -----CHEROKEE COUNTY-----

cherokee <- read.csv(file="cherokee_county.csv")
cherokee$FixedDate <- as.Date(cherokee$Date,format="%Y-%m-%d")
cherokee <- cherokee[-c(1:204), ]
cherokee <- cherokee[complete.cases(cherokee),]

# -----ROCKDALE COUNTY-----

rockdale <- read.csv(file="rockdale_county.csv")
rockdale$FixedDate <- as.Date(rockdale$Date,format="%Y-%m-%d")
rockdale <- rockdale[-c(1:204), ]
rockdale <- rockdale[complete.cases(rockdale),]

# -----BUTTS COUNTY-----

butts <- read.csv(file="butts_county.csv")
butts$FixedDate <- as.Date(butts$Date,format="%Y-%m-%d")
butts <- butts[-c(1:204), ]
butts <- butts[complete.cases(butts),]

# -----BARROW COUNTY-----

barrow <- read.csv(file="barrow_county.csv")
barrow$FixedDate <- as.Date(barrow$Date,format="%Y-%m-%d")
barrow <- barrow[-c(1:204), ]
barrow <- barrow[complete.cases(barrow),]

# -----COWETA COUNTY-----

coweta <- read.csv(file="coweta_county.csv")
coweta$FixedDate <- as.Date(coweta$Date,format="%Y-%m-%d")
coweta <- coweta[-c(1:204), ]
coweta <- coweta[complete.cases(coweta),]

# -----BARTOW COUNTY-----

bartow <- read.csv(file="bartow_county.csv")
bartow$FixedDate <- as.Date(bartow$Date,format="%Y-%m-%d")
bartow <- bartow[-c(1:204), ]
bartow <- bartow[complete.cases(bartow),]

# -----CARROLL COUNTY-----

carroll_ga <- read.csv(file="carroll_county.csv")
carroll_ga$FixedDate <- as.Date(carroll_ga$Date,format="%Y-%m-%d")
carroll_ga <- carroll_ga[-c(1:204), ]
carroll_ga <- carroll_ga[complete.cases(carroll_ga),]

# -----PAULDING COUNTY-----

paulding <- read.csv(file="paulding_county.csv")
paulding$FixedDate <- as.Date(paulding$Date,format="%Y-%m-%d")
paulding <- paulding[-c(1:204), ]
paulding <- paulding[complete.cases(paulding),]

# -----PICKENS COUNTY-----

pickens <- read.csv(file="pickens_county.csv")
pickens$FixedDate <- as.Date(pickens$Date,format="%Y-%m-%d")
pickens <- pickens[-c(1:204), ]
pickens <- pickens[complete.cases(pickens),]

# -----SPALDING COUNTY-----

spalding <- read.csv(file="spalding_county.csv")
spalding$FixedDate <- as.Date(spalding$Date,format="%Y-%m-%d")
spalding <- spalding[-c(1:204), ]
spalding <- spalding[complete.cases(spalding),]

# -----Data frame updates-----

south <- rbind(south, list ("Fulton", mean(fulton[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("DeKalb", mean(dekalb[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Gwinnett", mean(gwinnett[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Cobb", mean(cobb[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Clayton", mean(clayton[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Walton", mean(walton[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Newton", mean(newton[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Douglas", mean(douglas[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Fayette", mean(fayette[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Forsyth", mean(forsyth[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Henry", mean(henry[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Cherokee", mean(cherokee[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Rockdale", mean(rockdale[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c13],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c13],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c13],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c13],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c13],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c13] + county.data$PER_HIS[county.data$COUNTY_ABBR==c13]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Butts", mean(butts[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c14],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c14],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c14],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c14],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c14],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c14] + county.data$PER_HIS[county.data$COUNTY_ABBR==c14]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Barrow", mean(barrow[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c15],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c15],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c15],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c15],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c15],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c15] + county.data$PER_HIS[county.data$COUNTY_ABBR==c15]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Coweta", mean(coweta[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c16],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c16],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c16],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c16],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c16],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c16] + county.data$PER_HIS[county.data$COUNTY_ABBR==c16]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Bartow", mean(bartow[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c17],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c17],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c17],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c17],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c17],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c17] + county.data$PER_HIS[county.data$COUNTY_ABBR==c17]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Carroll (GA)", mean(carroll_ga[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c18],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c18],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c18],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c18],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c18],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c18] + county.data$PER_HIS[county.data$COUNTY_ABBR==c18]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Paulding", mean(paulding[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c19],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c19],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c19],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c19],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c19],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c19] + county.data$PER_HIS[county.data$COUNTY_ABBR==c19]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Pickens", mean(pickens[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c20],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c20],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c20],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c20],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c20],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c20] + county.data$PER_HIS[county.data$COUNTY_ABBR==c20]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Paulding", mean(paulding[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c21],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c21],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c21],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c21],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c21],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c21] + county.data$PER_HIS[county.data$COUNTY_ABBR==c21]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----MIAMI-----

# String variables for counties in Miami MSA (to simplify code below)
c1 <- "Miami-Dade,FL"
c2 <- "Broward,FL"
c3 <- "Palm Beach,FL"

# Set directory for Miami MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/MIA")

# -----MIAMI-DADE COUNTY-----

miami_dade <- read.csv(file="miami-dade_county.csv")
miami_dade$FixedDate <- as.Date(miami_dade$Date,format="%Y-%m-%d")
miami_dade <- miami_dade[-c(1:204), ]
miami_dade <- miami_dade[complete.cases(miami_dade),]

# -----BROWARD COUNTY-----

broward <- read.csv(file="broward_county.csv")
broward$FixedDate <- as.Date(broward$Date,format="%Y-%m-%d")
broward <- broward[-c(1:204), ]
broward <- broward[complete.cases(broward),]

# -----PALM BEACH COUNTY-----

palm_beach <- read.csv(file="palm_beach_county.csv")
palm_beach$FixedDate <- as.Date(palm_beach$Date,format="%Y-%m-%d")
palm_beach <- palm_beach[-c(1:204), ]
palm_beach <- palm_beach[complete.cases(palm_beach),]

# -----Data frame updates-----

south <- rbind(south, list ("Miami-Dade", mean(miami_dade[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Broward", mean(broward[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Palm Beach", mean(palm_beach[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----TAMPA BAY-----

# String variables for counties in Tampa-St. Petersburg MSA (to simplify code below)
c1 <- "Hillsborough,FL"
c2 <- "Pinellas,FL"
c3 <- "Hernando,FL"
c4 <- "Pasco,FL"

# Set directory for Tampa-St. Petersburg MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/TB")

# -----HILLSBOROUGH COUNTY-----

hillsborough <- read.csv(file="hillsborough_county.csv")
hillsborough$FixedDate <- as.Date(hillsborough$Date,format="%Y-%m-%d")
hillsborough <- hillsborough[-c(1:204), ]
hillsborough <- hillsborough[complete.cases(hillsborough),]

# -----PINELLAS COUNTY-----

pinellas <- read.csv(file="pinellas_county.csv")
pinellas$FixedDate <- as.Date(pinellas$Date,format="%Y-%m-%d")
pinellas <- pinellas[-c(1:204), ]
pinellas <- pinellas[complete.cases(pinellas),]

# -----HERNANDO COUNTY-----

hernando <- read.csv(file="hernando_county.csv")
hernando$FixedDate <- as.Date(hernando$Date,format="%Y-%m-%d")
hernando <- hernando[-c(1:204), ]
hernando <- hernando[complete.cases(hernando),]

# -----PASCO COUNTY-----

pasco <- read.csv(file="pasco_county.csv")
pasco$FixedDate <- as.Date(pasco$Date,format="%Y-%m-%d")
pasco <- pasco[-c(1:204), ]
pasco <- pasco[complete.cases(pasco),]

# -----Data frame updates-----

south <- rbind(south, list ("Hillsborough", mean(hillsborough[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Pinellas", mean(pinellas[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Hernando", mean(hernando[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Pasco", mean(pasco[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----JACKSONVILLE-----

# String variables for counties in Jacksonville MSA (to simplify code below)
c1 <- "Duval,FL"
c2 <- "St. Johns,FL"
c3 <- "Clay,FL"
c4 <- "Nassau,FL"
c5 <- "Baker,FL"

# Set directory for Jacksonville MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/JAX")

# -----DUVAL COUNTY-----

duval <- read.csv(file="duval_county.csv")
duval$FixedDate <- as.Date(duval$Date,format="%Y-%m-%d")
duval <- duval[-c(1:204), ]
duval <- duval[complete.cases(duval),]

# -----ST. JOHNS COUNTY-----

st_johns <- read.csv(file="st_johns_county.csv")
st_johns$FixedDate <- as.Date(st_johns$Date,format="%Y-%m-%d")
st_johns <- st_johns[-c(1:204), ]
st_johns <- st_johns[complete.cases(st_johns),]

# -----CLAY COUNTY-----

clay <- read.csv(file="clay_county.csv")
clay$FixedDate <- as.Date(clay$Date,format="%Y-%m-%d")
clay <- clay[-c(1:204), ]
clay <- clay[complete.cases(clay),]

# -----NASSAU COUNTY-----

nassau <- read.csv(file="nassau_county.csv")
nassau$FixedDate <- as.Date(nassau$Date,format="%Y-%m-%d")
nassau <- nassau[-c(1:204), ]
nassau <- nassau[complete.cases(nassau),]

# -----BAKER COUNTY-----

baker <- read.csv(file="baker_county.csv")
baker$FixedDate <- as.Date(baker$Date,format="%Y-%m-%d")
baker <- baker[-c(1:204), ]
baker <- baker[complete.cases(baker),]

# -----Data frame updates-----

south <- rbind(south, list ("Duval", mean(duval[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("St. Johns", mean(st_johns[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Clay", mean(clay[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Nassau", mean(nassau[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Baker", mean(baker[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----CAROLINA-----

# String variables for counties in Charlotte MSA (to simplify code below)
c1 <- "Mecklenburg,NC"
c2 <- "York,SC"
c3 <- "Union,NC"
c4 <- "Gaston,NC"
c5 <- "Cabarrus,NC"
c6 <- "Iredell,NC"
c7 <- "Rowan,NC"
c8 <- "Lancaster,SC"
c9 <- "Cleveland,NC"
c10 <- "Lincoln,NC"
c11 <- "Stanly,NC"
c12 <- "Chester,SC"

# Set directory for Charlotte MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/CAR")

# -----MECKLENBURG COUNTY-----

mecklenburg <- read.csv(file="mecklenburg_county.csv")
mecklenburg$FixedDate <- as.Date(mecklenburg$Date,format="%Y-%m-%d")
mecklenburg <- mecklenburg[-c(1:204), ]
mecklenburg <- mecklenburg[complete.cases(mecklenburg),]

# -----YORK COUNTY-----

york <- read.csv(file="york_county.csv")
york$FixedDate <- as.Date(york$Date,format="%Y-%m-%d")
york <- york[-c(1:204), ]
york <- york[complete.cases(york),]

# -----UNION COUNTY-----

union <- read.csv(file="union_county.csv")
union$FixedDate <- as.Date(union$Date,format="%Y-%m-%d")
union <- union[-c(1:204), ]
union <- union[complete.cases(union),]

# -----GASTON COUNTY-----

gaston <- read.csv(file="gaston_county.csv")
gaston$FixedDate <- as.Date(gaston$Date,format="%Y-%m-%d")
gaston <- gaston[-c(1:204), ]
gaston <- gaston[complete.cases(gaston),]

# -----CABARRUS COUNTY-----

cabarrus <- read.csv(file="cabarrus_county.csv")
cabarrus$FixedDate <- as.Date(cabarrus$Date,format="%Y-%m-%d")
cabarrus <- cabarrus[-c(1:204), ]
cabarrus <- cabarrus[complete.cases(cabarrus),]

# -----IREDELL COUNTY-----

iredell <- read.csv(file="iredell_county.csv")
iredell$FixedDate <- as.Date(iredell$Date,format="%Y-%m-%d")
iredell <- iredell[-c(1:204), ]
iredell <- iredell[complete.cases(iredell),]

# -----ROWAN COUNTY-----

rowan <- read.csv(file="rowan_county.csv")
rowan$FixedDate <- as.Date(rowan$Date,format="%Y-%m-%d")
rowan <- rowan[-c(1:204), ]
rowan <- rowan[complete.cases(rowan),]

# -----LANCASTER COUNTY-----

lancaster <- read.csv(file="lancaster_county.csv")
lancaster$FixedDate <- as.Date(lancaster$Date,format="%Y-%m-%d")
lancaster <- lancaster[-c(1:204), ]
lancaster <- lancaster[complete.cases(lancaster),]

# -----CLEVELAND COUNTY-----

cleveland <- read.csv(file="cleveland_county.csv")
cleveland$FixedDate <- as.Date(cleveland$Date,format="%Y-%m-%d")
cleveland <- cleveland[-c(1:204), ]
cleveland <- cleveland[complete.cases(cleveland),]

# -----LINCOLN COUNTY-----

lincoln <- read.csv(file="lincoln_county.csv")
lincoln$FixedDate <- as.Date(lincoln$Date,format="%Y-%m-%d")
lincoln <- lincoln[-c(1:204), ]
lincoln <- lincoln[complete.cases(lincoln),]

# -----STANLY COUNTY-----

stanly <- read.csv(file="stanly_county.csv")
stanly$FixedDate <- as.Date(stanly$Date,format="%Y-%m-%d")
stanly <- stanly[-c(1:204), ]
stanly <- stanly[complete.cases(stanly),]

# -----CHESTER COUNTY-----

chester <- read.csv(file="chester_county.csv")
chester$FixedDate <- as.Date(chester$Date,format="%Y-%m-%d")
chester <- chester[-c(1:204), ]
chester <- chester[complete.cases(chester),]

# -----Data frame updates-----

south <- rbind(south, list ("Mecklenburg", mean(mecklenburg[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("York", mean(york[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Union", mean(union[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Gaston", mean(gaston[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Cabarrus", mean(cabarrus[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Iredell", mean(iredell[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Rowan", mean(rowan[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Lancaster", mean(lancaster[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Cleveland", mean(cleveland[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Lincoln", mean(lincoln[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Stanly", mean(stanly[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c11],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c11],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c11],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c11],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c11],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c11] + county.data$PER_HIS[county.data$COUNTY_ABBR==c11]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                    stadium.data$OVER_20[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

south <- rbind(south, list ("Chester", mean(chester[,"Rt"]),
                            county.data$PER_SMOKE[county.data$COUNTY_ABBR==c12],
                            county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c12],
                            county.data$DENSITY_POP[county.data$COUNTY_ABBR==c12],
                            county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c12],
                            voting.data$NOT.BIDEN..[voting.data$COUNTY==c12],
                            (county.data$PER_BLACK[county.data$COUNTY_ABBR==c12] + county.data$PER_HIS[county.data$COUNTY_ABBR==c12]),
                            stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                            stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                            stadium.data$X10_TO_20[stadium.data$COUNTY==c1],
                            stadium.data$OVER_20[stadium.data$COUNTY==c1],
                            mask.data$MANDATE[mask.data$COUNTY==c1]))

#south_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + Mask, data=south)
south_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + Mask + Under_Ten + Ten_to_Twenty + Over_Twenty, data=south)
#south_fit <- lm(Rt ~ Under_Ten + Ten_to_Twenty + Over_Twenty, data=south)
summary(south_fit)
#boxplot(south_fit[['residuals']],main='Boxplot: Residuals',ylab='residual value')