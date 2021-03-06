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

similar_terms_data <- "spy"
opts <- list()
opts[["resultLanguages"]] <- list("deu", "spa", "jpn")

parameters <- list()
parameters[["content"]] <- similar_terms_data
parameters[["options"]] <- opts

if (is.na(opt$url)) {
   result <- api(opt$key, "semantics/similar", parameters)
} else {
   result <- api(opt$key, "semantics/similar", parameters, NULL, NULL, opt$url)
}
print(jsonlite::toJSON(result$header, pretty = TRUE))
print(jsonlite::toJSON(result$content, pretty = TRUE))
