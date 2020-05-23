library(tidyverse)
library(ggplot2)
library(readr)
library(maps)
library(viridis)

## get the COVID-19 data
dt_covid <- read_csv("time_series_covid19_confirmed_global.csv")
## get the world map
world <- map_data("world")
# cutoffs based on the number of cases
mybreaks <- c(1, 20, 100, 1000, 50000)

#Some mapping I'm working on
#mapping covid_19 confirmed cases globally is just for refernce. We can use this for early slides
#Need to do mapping across USA, to see covid_19 outbreak across the states within the US (to answer Question3)
#I'm thinking to map death\mortality across USA to check whether airquality leads to high number of dealth
ggplot()
geom_polygon(data = world, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point(data=dt_covid, aes(x=Long, y=Lat, size=`3/3/20`, color=`3/3/20`),stroke=F, alpha=0.7) +
  scale_size_continuous(name="Cases", trans="log", range=c(1,7),breaks=mybreaks, labels = c("1-19", "20-99", "100-999", "1,000-49,999", "50,000+")) +
  #scale_alpha_continuous(name="Cases", trans="log", range=c(0.1, 0.9),breaks=mybreaks) +
  scale_color_viridis_c(option="inferno",name="Cases", trans="log",breaks=mybreaks, labels = c("1-19", "20-99", "100-999", "1,000-49,999", "50,000+")) +
  theme_void() +
  guides( colour = guide_legend()) +
  labs(caption = "Data Repository provided by Johns Hopkins CSSE") +
  theme(
    legend.position = "bottom",
    text = element_text(color = "#22211d"),
    plot.background = element_rect(fill = "#ffffff", color = NA),
    panel.background = element_rect(fill = "#ffffff", color = NA),
    legend.background = element_rect(fill = "#ffffff", color = NA)
  )

#




