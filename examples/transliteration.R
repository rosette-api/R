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

transliteration_data <- "ana r2ye7 el gam3a el sa3a 3 el 3asr"

parameters <- list()
parameters[["content"]] <- transliteration_data

if (is.na(opt$url)) {
  result <- api(opt$key, "transliteration", parameters)
} else {
  result <- api(opt$key, "transliteration", parameters, NULL, NULL, opt$url)
}
print(jsonlite::toJSON(result$header, pretty = TRUE))
print(jsonlite::toJSON(result$content, pretty = TRUE))
