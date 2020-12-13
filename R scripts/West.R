# Import county data
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files")
county.data <- read.csv(file="county_demo_health.csv")
voting.data <- read.csv(file="voting by county.csv")
stadium.data <- read.csv(file="games with fans-wk 4.csv")
mask.data <- read.csv(file="mask mandates.csv")

# -----SEATTLE-----

# String variables for counties in Seattle MSA (to simplify code below)
c1 <- "King,WA"
c2 <- "Pierce,WA"
c3 <- "Snohomish,WA"

# Set directory for Seattle MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/SEA")

# -----KING COUNTY-----

king <- read.csv(file="king_county.csv")
king$FixedDate <- as.Date(king$Date,format="%Y-%m-%d")
king <- king[-c(1:204), ]
king <- king[complete.cases(king),]

# -----PIERCE COUNTY-----

pierce <- read.csv(file="pierce_county.csv")
pierce$FixedDate <- as.Date(pierce$Date,format="%Y-%m-%d")
pierce <- pierce[-c(1:204), ]
pierce <- pierce[complete.cases(pierce),]

# -----SNOHOMISH COUNTY-----

snohomish <- read.csv(file="snohomish_county.csv")
snohomish$FixedDate <- as.Date(snohomish$Date,format="%Y-%m-%d")
snohomish <- snohomish[-c(1:204), ]
snohomish <- snohomish[complete.cases(snohomish),]

# -----Data frame updates-----

west <- data.frame("County" = "King", "Rt" = mean(king[,"Rt"]),
                "Smoke" = county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                "Household" = county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                "Density" = county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                "College" = county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                "R_Voting" = voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                "Black_His" = (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                "No_Fans" = stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                "Under_Ten" = stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                "Mask" = mask.data$MANDATE[mask.data$COUNTY==c1])

west <- rbind(west, list ("Pierce", mean(pierce[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))
               
west <- rbind(west, list ("Snohomish", mean(snohomish[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----SAN FRANCISCO-----

# String variables for counties in San Francisco MSA (to simplify code below)
c1 <- "Santa Clara,CA"
c2 <- "San Benito,CA"
c3 <- "Alameda,CA"
c4 <- "Contra Costa,CA"
c5 <- "San Francisco,CA"
c6 <- "San Mateo,CA"
c7 <- "Marin,CA"

# Set directory for San Francisco MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/SF")

# -----SANTA CLARA COUNTY-----

santa_clara <- read.csv(file="santa_clara_county.csv")
santa_clara$FixedDate <- as.Date(santa_clara$Date,format="%Y-%m-%d")
santa_clara <- santa_clara[-c(1:204), ]
santa_clara <- santa_clara[complete.cases(santa_clara),]

# -----SAN BENITO COUNTY-----

san_benito <- read.csv(file="san_benito_county.csv")
san_benito$FixedDate <- as.Date(san_benito$Date,format="%Y-%m-%d")
san_benito <- san_benito[-c(1:204), ]
san_benito <- san_benito[complete.cases(san_benito),]

# -----ALAMEDA COUNTY-----

alameda <- read.csv(file="alameda_county.csv")
alameda$FixedDate <- as.Date(alameda$Date,format="%Y-%m-%d")
alameda <- alameda[-c(1:204), ]
alameda <- alameda[complete.cases(alameda),]

# -----CONTRA COSTA COUNTY-----

contra_costa <- read.csv(file="contra_costa_county.csv")
contra_costa$FixedDate <- as.Date(contra_costa$Date,format="%Y-%m-%d")
contra_costa <- contra_costa[-c(1:204), ]
contra_costa <- contra_costa[complete.cases(contra_costa),]

# -----SAN FRANCISCO COUNTY-----

san_francisco <- read.csv(file="san_francisco_county.csv")
san_francisco$FixedDate <- as.Date(san_francisco$Date,format="%Y-%m-%d")
san_francisco <- san_francisco[-c(1:204), ]
san_francisco <- san_francisco[complete.cases(san_francisco),]

# -----SAN MATEO COUNTY-----

san_mateo <- read.csv(file="san_mateo_county.csv")
san_mateo$FixedDate <- as.Date(san_mateo$Date,format="%Y-%m-%d")
san_mateo <- san_mateo[-c(1:204), ]
san_mateo <- san_mateo[complete.cases(san_mateo),]

# -----MARIN COUNTY-----

marin <- read.csv(file="marin_county.csv")
marin$FixedDate <- as.Date(marin$Date,format="%Y-%m-%d")
marin <- marin[-c(1:204), ]
marin <- marin[complete.cases(marin),]

# -----Data frame updates-----

west <- rbind(west, list ("Santa Clara", mean(santa_clara[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("San Benito", mean(san_benito[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Alameda", mean(alameda[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Contra Costa", mean(contra_costa[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("San Francisco", mean(san_francisco[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("San Mateo", mean(san_mateo[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Marin", mean(marin[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----LOS ANGELES-----

# String variables for counties in Los Angeles MSA (to simplify code below)
c1 <- "Los Angeles,CA"
c2 <- "Orange,CA"

# Set directory for Los Angeles MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/LAC-LAR")

# -----LOS ANGELES COUNTY-----

los_angeles <- read.csv(file="los_angeles_county.csv")
los_angeles$FixedDate <- as.Date(los_angeles$Date,format="%Y-%m-%d")
los_angeles <- los_angeles[-c(1:204), ]
los_angeles <- los_angeles[complete.cases(los_angeles),]

# -----ORANGE COUNTY-----

orange <- read.csv(file="orange_county.csv")
orange$FixedDate <- as.Date(orange$Date,format="%Y-%m-%d")
orange <- orange[-c(1:204), ]
orange <- orange[complete.cases(orange),]

# -----Data frame updates-----

west <- rbind(west, list ("Los Angeles", mean(los_angeles[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Orange", mean(orange[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----LAS VEGAS-----

# String variables for counties in Las Vegas MSA (to simplify code below)
c1 <- "Clark,NV"

# Set directory for Las Vegas MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/LV")

# -----CLARK COUNTY-----

clark <- read.csv(file="clark_county.csv")
clark$FixedDate <- as.Date(clark$Date,format="%Y-%m-%d")
clark <- clark[-c(1:204), ]
clark <- clark[complete.cases(clark),]

# -----Data frame updates-----

west <- rbind(west, list ("Clark", mean(clark[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----DENVER-----

# String variables for counties in Denver MSA (to simplify code below)
c1 <- "Denver,CO"
c2 <- "Arapahoe,CO"
c3 <- "Jefferson,CO"
c4 <- "Adams,CO"
c5 <- "Douglas,CO"
c6 <- "Broomfield,CO"
c7 <- "Elbert,CO"
c8 <- "Park,CO"
c9 <- "Clear Creek,CO"
c10 <- "Gilpin,CO"

# Set directory for Denver MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/DEN")

# -----DENVER COUNTY-----

denver <- read.csv(file="denver_county.csv")
denver$FixedDate <- as.Date(denver$Date,format="%Y-%m-%d")
denver <- denver[-c(1:204), ]
denver <- denver[complete.cases(denver),]

# -----ARAPAHOE COUNTY-----

arapahoe <- read.csv(file="arapahoe_county.csv")
arapahoe$FixedDate <- as.Date(arapahoe$Date,format="%Y-%m-%d")
arapahoe <- arapahoe[-c(1:204), ]
arapahoe <- arapahoe[complete.cases(arapahoe),]

# -----JEFFERSON COUNTY-----

jefferson <- read.csv(file="jefferson_county.csv")
jefferson$FixedDate <- as.Date(jefferson$Date,format="%Y-%m-%d")
jefferson <- jefferson[-c(1:204), ]
jefferson <- jefferson[complete.cases(jefferson),]

# -----ADAMS COUNTY-----

adams <- read.csv(file="adams_county.csv")
adams$FixedDate <- as.Date(adams$Date,format="%Y-%m-%d")
adams <- adams[-c(1:204), ]
adams <- adams[complete.cases(adams),]

# -----DOUGLAS COUNTY-----

douglas <- read.csv(file="douglas_county.csv")
douglas$FixedDate <- as.Date(douglas$Date,format="%Y-%m-%d")
douglas <- douglas[-c(1:204), ]
douglas <- douglas[complete.cases(douglas),]

# -----BROOMFIELD COUNTY-----

broomfield <- read.csv(file="broomfield_county.csv")
broomfield$FixedDate <- as.Date(broomfield$Date,format="%Y-%m-%d")
broomfield <- broomfield[-c(1:204), ]
broomfield <- broomfield[complete.cases(broomfield),]

# -----ELBERT COUNTY-----

elbert <- read.csv(file="elbert_county.csv")
elbert$FixedDate <- as.Date(elbert$Date,format="%Y-%m-%d")
elbert <- elbert[-c(1:204), ]
elbert <- elbert[complete.cases(elbert),]

# -----PARK COUNTY-----

park <- read.csv(file="park_county.csv")
park$FixedDate <- as.Date(park$Date,format="%Y-%m-%d")
park <- park[-c(1:204), ]
park <- park[complete.cases(park),]

# -----CLEAR CREEK COUNTY-----

clear_creek <- read.csv(file="clear_creek_county.csv")
clear_creek$FixedDate <- as.Date(clear_creek$Date,format="%Y-%m-%d")
clear_creek <- clear_creek[-c(1:204), ]
clear_creek <- clear_creek[complete.cases(clear_creek),]

# -----GILPIN COUNTY-----

gilpin <- read.csv(file="gilpin_county.csv")
gilpin$FixedDate <- as.Date(gilpin$Date,format="%Y-%m-%d")
gilpin <- gilpin[-c(1:204), ]
gilpin <- gilpin[complete.cases(gilpin),]

# -----Data frame updates-----

west <- rbind(west, list ("Denver", mean(denver[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Arapahoe", mean(arapahoe[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Jefferson", mean(jefferson[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Adams", mean(adams[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c4],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c4],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c4],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c4],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c4],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c4] + county.data$PER_HIS[county.data$COUNTY_ABBR==c4]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Douglas", mean(douglas[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c5],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c5],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c5],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c5],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c5],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c5] + county.data$PER_HIS[county.data$COUNTY_ABBR==c5]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Broomfield", mean(broomfield[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c6],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c6],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c6],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c6],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c6],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c6] + county.data$PER_HIS[county.data$COUNTY_ABBR==c6]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Elbert", mean(elbert[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c7],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c7],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c7],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c7],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c7],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c7] + county.data$PER_HIS[county.data$COUNTY_ABBR==c7]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Park", mean(park[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c8],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c8],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c8],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c8],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c8],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c8] + county.data$PER_HIS[county.data$COUNTY_ABBR==c8]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Clear Creek", mean(clear_creek[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c9],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c9],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c9],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c9],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c9],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c9] + county.data$PER_HIS[county.data$COUNTY_ABBR==c9]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Gilpin", mean(gilpin[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c10],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c10],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c10],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c10],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c10],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c10] + county.data$PER_HIS[county.data$COUNTY_ABBR==c10]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

# -----ARIZONA-----

# String variables for counties in Phoenix MSA (to simplify code below)
c1 <- "Maricopa,AZ"
c2 <- "Pinal,AZ"
c3 <- "Gila,AZ"

# Set directory for Phoenix MSA
setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files/ARI")

# -----MARICOPA COUNTY-----

maricopa <- read.csv(file="maricopa_county.csv")
maricopa$FixedDate <- as.Date(maricopa$Date,format="%Y-%m-%d")
maricopa <- maricopa[-c(1:204), ]
maricopa <- maricopa[complete.cases(maricopa),]

# -----PINAL COUNTY-----

pinal <- read.csv(file="pinal_county.csv")
pinal$FixedDate <- as.Date(pinal$Date,format="%Y-%m-%d")
pinal <- pinal[-c(1:204), ]
pinal <- pinal[complete.cases(pinal),]

# -----GILA COUNTY-----

gila <- read.csv(file="gila_county.csv")
gila$FixedDate <- as.Date(gila$Date,format="%Y-%m-%d")
gila <- gila[-c(1:204), ]
gila <- gila[complete.cases(gila),]

# -----Data frame updates-----

west <- rbind(west, list ("Maricopa", mean(maricopa[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c1],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c1],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c1],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c1],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c1],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c1] + county.data$PER_HIS[county.data$COUNTY_ABBR==c1]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Pinal", mean(pinal[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c2],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c2],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c2],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c2],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c2],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c2] + county.data$PER_HIS[county.data$COUNTY_ABBR==c2]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

west <- rbind(west, list ("Gila", mean(gila[,"Rt"]),
                    county.data$PER_SMOKE[county.data$COUNTY_ABBR==c3],
                    county.data$HOUSEHOLD_SIZE[county.data$COUNTY_ABBR==c3],
                    county.data$DENSITY_POP[county.data$COUNTY_ABBR==c3],
                    county.data$PER_COLLEGE_EDU[county.data$COUNTY_ABBR==c3],
                    voting.data$NOT.BIDEN..[voting.data$COUNTY==c3],
                    (county.data$PER_BLACK[county.data$COUNTY_ABBR==c3] + county.data$PER_HIS[county.data$COUNTY_ABBR==c3]),
                    stadium.data$NO_FANS[stadium.data$COUNTY==c1],
                    stadium.data$UNDER_10[stadium.data$COUNTY==c1],
                    mask.data$MANDATE[mask.data$COUNTY==c1]))

#west_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + Mask, data=west)
#west_fit <- lm(Rt ~ log(Density) + College + R_Voting + Black_His + Smoke + Mask + No_Fans + Under_Ten, data=west)
west_fit <- lm(Rt ~ No_Fans + Under_Ten, data=west)
summary(west_fit)
#boxplot(west_fit[['residuals']],main='Boxplot: Residuals',ylab='residual value')