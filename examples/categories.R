source("../R/Api.R")
library(jsonlite)
library(optparse)

option_list <- list(
  make_option(c("-k", "--key"),
    action = "store", default = NA, type = "character",
    help = "Rosette API key"),
  make_option(c("-u", "--url"),
    action = "store", default = NA, type = "character",
    help = "Rosette API url"))
opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)

categories_url_data <- "https://onlocationvacations.com/2018/02/06/downton-abbey-exhibition-extended-april-2-nyc/"

parameters <- list()
parameters[["contentUri"]] <- categories_url_data

if (is.na(opt$url)) {
   result <- api(opt$key, "categories", parameters)
} else {
   result <- api(opt$key, "categories", parameters, NULL, NULL, opt$url)
}
print(jsonlite::toJSON(result$header, pretty = TRUE))
print(jsonlite::toJSON(result$content, pretty = TRUE))
