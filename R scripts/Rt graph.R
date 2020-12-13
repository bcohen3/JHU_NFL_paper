library(ggplot2)

setwd("/Users/bscohen/Desktop/stats paper/Resources/county CSV files")

allegheny.data <- read.csv(file="./PIT/allegheny_county.csv")
allegheny.data$FixedDate <- as.Date(allegheny.data$Date,format="%Y-%m-%d")
allegheny.data <- allegheny.data[-c(1:82), ]

baltimore_city.data <- read.csv(file="./BAL/baltimore_city.csv")
baltimore_city.data$FixedDate <- as.Date(baltimore_city.data$Date,format="%Y-%m-%d")
baltimore_city.data <- baltimore_city.data[-c(1:204), ]

bergen.data <- read.csv(file="./NYG-NYJ/bergen_county.csv")
bergen.data$FixedDate <- as.Date(bergen.data$Date,format="%Y-%m-%d")
bergen.data <- bergen.data[-c(1:204), ]

brown.data <- read.csv(file="./GB/brown_county.csv")
brown.data$FixedDate <- as.Date(brown.data$Date,format="%Y-%m-%d")
brown.data <- brown.data[-c(1:204), ]

clark.data <- read.csv(file="./LV/clark_county.csv")
clark.data$FixedDate <- as.Date(clark.data$Date,format="%Y-%m-%d")
clark.data <- clark.data[-c(1:204), ]

cook.data <- read.csv(file="./CHI/cook_county.csv")
cook.data$FixedDate <- as.Date(cook.data$Date,format="%Y-%m-%d")
cook.data <- cook.data[-c(1:204), ]

cuyahoga.data <- read.csv(file="./CLE/cuyahoga_county.csv")
cuyahoga.data$FixedDate <- as.Date(cuyahoga.data$Date,format="%Y-%m-%d")
cuyahoga.data <- cuyahoga.data[-c(1:204), ]

davidson.data <- read.csv(file="./TEN/davidson_county.csv")
davidson.data$FixedDate <- as.Date(davidson.data$Date,format="%Y-%m-%d")
davidson.data <- davidson.data[-c(1:204), ]

denver.data <- read.csv(file="./DEN/denver_county.csv")
denver.data$FixedDate <- as.Date(denver.data$Date,format="%Y-%m-%d")
denver.data <- denver.data[-c(1:204), ]

duval.data <- read.csv(file="./JAX/duval_county.csv")
duval.data$FixedDate <- as.Date(duval.data$Date,format="%Y-%m-%d")
duval.data <- duval.data[-c(1:48), ]

erie.data <- read.csv(file="./BUF/erie_county.csv")
erie.data$FixedDate <- as.Date(erie.data$Date,format="%Y-%m-%d")
erie.data <- erie.data[-c(1:204), ]

fulton.data <- read.csv(file="./ATL/fulton_county.csv")
fulton.data$FixedDate <- as.Date(fulton.data$Date,format="%Y-%m-%d")
fulton.data <- fulton.data[-c(1:204), ]

hamilton.data <- read.csv(file="./CIN/hamilton_county.csv")
hamilton.data$FixedDate <- as.Date(hamilton.data$Date,format="%Y-%m-%d")
hamilton.data <- hamilton.data[-c(1:204), ]

harris.data <- read.csv(file="./HOU/harris_county.csv")
harris.data$FixedDate <- as.Date(harris.data$Date,format="%Y-%m-%d")
harris.data <- harris.data[-c(1:204), ]

hennepin.data <- read.csv(file="./MIN/hennepin_county.csv")
hennepin.data$FixedDate <- as.Date(hennepin.data$Date,format="%Y-%m-%d")
hennepin.data <- hennepin.data[-c(1:204), ]

hillsborough.data <- read.csv(file="./TB/hillsborough_county.csv")
hillsborough.data$FixedDate <- as.Date(hillsborough.data$Date,format="%Y-%m-%d")
hillsborough.data <- hillsborough.data[-c(1:48), ]

jackson.data <- read.csv(file="./KC/jackson_county.csv")
jackson.data$FixedDate <- as.Date(jackson.data$Date,format="%Y-%m-%d")
jackson.data <- jackson.data[-c(1:204), ]

king.data <- read.csv(file="./SEA/king_county.csv")
king.data$FixedDate <- as.Date(king.data$Date,format="%Y-%m-%d")
king.data <- king.data[-c(1:204), ]

los_angeles.data <- read.csv(file="./LAC-LAR/los_angeles_county.csv")
los_angeles.data$FixedDate <- as.Date(los_angeles.data$Date,format="%Y-%m-%d")
los_angeles.data <- los_angeles.data[-c(1:204), ]

maricopa.data <- read.csv(file="./ARI/maricopa_county.csv")
maricopa.data$FixedDate <- as.Date(maricopa.data$Date,format="%Y-%m-%d")
maricopa.data <- maricopa.data[-c(1:204), ]

marion.data <- read.csv(file="./IND/marion_county.csv")
marion.data$FixedDate <- as.Date(marion.data$Date,format="%Y-%m-%d")
marion.data <- marion.data[-c(1:204), ]

mecklenburg.data <- read.csv(file="./CAR/mecklenburg_county.csv")
mecklenburg.data$FixedDate <- as.Date(mecklenburg.data$Date,format="%Y-%m-%d")
mecklenburg.data <- mecklenburg.data[-c(1:204), ]

miami_dade.data <- read.csv(file="./MIA/miami-dade_county.csv")
miami_dade.data$FixedDate <- as.Date(miami_dade.data$Date,format="%Y-%m-%d")
miami_dade.data <- miami_dade.data[-c(1:48), ]

norfolk.data <- read.csv(file="./NE/norfolk_county.csv")
norfolk.data$FixedDate <- as.Date(norfolk.data$Date,format="%Y-%m-%d")
norfolk.data <- norfolk.data[-c(1:204), ]

orleans.data <- read.csv(file="./NO/orleans_parish.csv")
orleans.data$FixedDate <- as.Date(orleans.data$Date,format="%Y-%m-%d")
orleans.data <- orleans.data[-c(1:204), ]

philadelphia.data <- read.csv(file="./PHI/philadelphia_county.csv")
philadelphia.data$FixedDate <- as.Date(philadelphia.data$Date,format="%Y-%m-%d")
philadelphia.data <- philadelphia.data[-c(1:82), ]

prince_georges.data <- read.csv(file="./WSH/prince_georges_county.csv")
prince_georges.data$FixedDate <- as.Date(prince_georges.data$Date,format="%Y-%m-%d")
prince_georges.data <- prince_georges.data[-c(1:204), ]

santa_clara.data <- read.csv(file="./SF/santa_clara_county.csv")
santa_clara.data$FixedDate <- as.Date(santa_clara.data$Date,format="%Y-%m-%d")
santa_clara.data <- santa_clara.data[-c(1:204), ]

tarrant.data <- read.csv(file="./DAL/tarrant_county.csv")
tarrant.data$FixedDate <- as.Date(tarrant.data$Date,format="%Y-%m-%d")
tarrant.data <- tarrant.data[-c(1:204), ]

wayne.data <- read.csv(file="./DET/wayne_county.csv")
wayne.data$FixedDate <- as.Date(wayne.data$Date,format="%Y-%m-%d")
wayne.data <- wayne.data[-c(1:204), ]

county.data <- read.csv(file="county_demo_health.csv")

PA.plot <- ggplot() + geom_line(aes(y = Rt, x = FixedDate, group = 1),
                                   data = allegheny.data, color="#ffb612")

PA.plot <- PA.plot + geom_line(aes(y = Rt, x = FixedDate, group = 1),
                                    data = philadelphia.data, color="#004c54")

PA.plot <- PA.plot + scale_x_date(date_labels = "%b %d")

PA.plot <- PA.plot + geom_vline(xintercept=as.numeric(as.Date("2020-10-04")),
                                color="blue", linetype="longdash")

PA.plot <- PA.plot + labs(x="Date", color="Legend") +
  ggtitle("Pennsylvania Rt Comparison") + theme(plot.title = element_text(hjust = 0.5))

PA.plot

FL.plot <- ggplot() + geom_line(aes(y = Rt, x = FixedDate, group = 1),
                                data = duval.data, color="#006778")

FL.plot <- FL.plot + geom_line(aes(y = Rt, x = FixedDate, group = 1),
                               data = hillsborough.data, color="#d50a0a")

FL.plot <- FL.plot + geom_line(aes(y = Rt, x = FixedDate, group = 1),
                               data = miami_dade.data, color="#008e97")

FL.plot <- FL.plot + scale_x_date(date_labels = "%b %d")

FL.plot <- FL.plot + geom_vline(xintercept=as.numeric(as.Date("2020-09-13")),
                                color="blue", linetype="longdash")

FL.plot <- FL.plot + labs(x="Date", color="Legend") +
  ggtitle("Florida Rt Comparison") + theme(plot.title = element_text(hjust = 0.5))

FL.plot

# FL.data <- read.csv(file="./_states/Florida.csv")
# FL.data$FixedDate <- as.Date(FL.data$Date,format="%Y-%m-%d")
# FL.data <- FL.data[-c(1:204), ]
# 
# CA.data <- read.csv(file="./_states/California.csv")
# CA.data$FixedDate <- as.Date(CA.data$Date,format="%Y-%m-%d")
# CA.data <- CA.data[-c(1:204), ]
# 
# state.plot <- ggplot() + geom_line(aes(y = Rt, x = Date, group = 1),
#                                     data = FL.data, color="red")
# 
# state.plot <- state.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                       data = CA.data, color="blue")
# 
# state.plot

# south.plot <- ggplot() + geom_line(aes(y = Rt, x = Date, group = 1),
#                                    data = davidson.data, color="#0C2340")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = duval.data, color="#006778")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = fulton.data, color="#A71930")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = harris.data, color="#03202F")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = hillsborough.data, color="#D50A0A")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = mecklenburg.data, color="#0085CA")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = miami_dade.data, color="#008E97")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = orleans.data, color="#D3BC8D")
# 
# south.plot <- south.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                      data = tarrant.data, color="#003594")
# 
# #south.plot
# 
# counties.plot <- ggplot() + geom_line(aes(y = Rt, x = Date, group = 1),
#                            data = allegheny.data, color="sky blue")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = baltimore_city.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = bergen.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = brown.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = clark.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = cook.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = cuyahoga.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = davidson.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = denver.data, color="sky blue")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = duval.data, color="red")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = erie.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = fulton.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = hamilton.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = harris.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = hennepin.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = hillsborough.data, color="red")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = jackson.data, color="red")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = king.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = los_angeles.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = maricopa.data, color="sky blue")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = marion.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = mecklenburg.data, color="sky blue")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = miami_dade.data, color="dark green")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = norfolk.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = orleans.data, color="sky blue")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = philadelphia.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = prince_georges.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = santa_clara.data, color="gray")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = tarrant.data, color="red")
# 
# counties.plot <- counties.plot + geom_line(aes(y = Rt, x = Date, group = 1),
#                                            data = wayne.data, color="gray")

#counties.plot <- counties.plot + geom_vline(xintercept=94, color="blue")

#counties.plot
