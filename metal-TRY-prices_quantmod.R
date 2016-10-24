# This script plots precious metal prices in TRY. Quantmod retrieve metal prices in Troy ounces so we need to convert the prices into gram. 

# http://www.quantmod.com/documentation/getMetals.html
# http://stackoverflow.com/questions/37139564/r-quantmod-chartseries-add-multiple-ta-overlay-to-single-chart
# http://www.r-chart.com/2010/06/stock-analysis-using-r.html

library(quantmod)

# First we retrieve prices in Turkish Lira:  
getMetals(c("gold", "platinum"), base.currency = "TRY")

# # This gives to xts results: "XAUUSD" "XPTUSD" which are given in troy ounce. 

# A possible source of confusion is that gold is often priced on the open market in the more traditional troy ounce (one troy ounce is exactly 31.1034768 grams, which is larger than the avoirdupois ounce generally in use in the United States and has a mass of 28.35 grams (https://en.wikipedia.org/wiki/Gold_gram)

# Convert prices into gram:
GoldTRY <- XAUTRY/31.1
PlatinumTRY <- XPTTRY/31.1

# First plot gold:
chartSeries(GoldTRY, subset = "last 12 months", name = "Gold (Gram - TRY)")

# Then platinum:
chartSeries(PlatinumTRY, subset = "last 12 months", name = "Platinum (Gram - TRY)")
