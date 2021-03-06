library(rmongodb)
library(jsonlite)
library(lubridate)
library(stringi)

# create connection to mongodb
mongo <- mongo.create()
# Are we connected?
mongo.is.connected(mongo)
# Databases available...
mongo.get.databases(mongo)
db <- "Books"
coll <- "Books.books"

mongo.count(mongo, coll)
# Very important with rmongodb to specify the argument names
bson <- mongo.findOne(mongo = mongo, ns = coll, query = '{"author.lastName":"Artuk"}')
book <- mongo.bson.to.list(bson)

# This works!
# The functions maxId, newPurchaseId, and insertOne all work. I'm currently using
#   them in the BookUpdate.R script, which works for now but needs to be turned
#   into a Shiny script.

maxId <- function(mongo, coll){
  queryID <- '{"purchaseId":{"$gt":20150000}}'
  fields <- '{"_id":0, "purchaseId":1}'
  sortOn <- '{"purchaseId":-1}'
  listIds <- mongo.find.all(mongo = mongo,
                            ns = coll,
                            query = queryID,
                            fields = fields,
                            sort = sortOn,
                            limit = 1)
  return(as.integer(listIds[[1]]))
}


newPurchaseId <- function(mongo, coll) {
  # returns the new purchase ID
  last <- maxId(mongo, coll)
  yr <- year(today())
  mo <- month(today())
  IDyear <- last %/% 10000
  IDmonth <- (last - IDyear * 10000) %/% 100
  if(yr == IDyear && mo == IDmonth){
    rv <- last + 1
  } else {
    rv <- yr * 10000 + mo * 100 + 1
  }
  return(rv)
}

insertOne <- function(mongo, coll, rec) {
  mongo.insert(mongo, coll, rec)
}

getISBN10 <- function(){}

getISBN13 <- function(s){
  # Determines the ISBN13 from the ISBN10
  # Remove dashes, if they exist
  s = stri_replace_all(s, replacement = "", regex = "-")
  ret <- paste("978", substr(s, 1, 9), sep = "")
  a <- as.numeric(lapply(X = 1:12, FUN = function(x){substr(ret, x, x)}))
  check = (10 - sum(a * (rep(c(1, 3), 6)))) %% 10
  return(paste(ret, check, sep = ""))
}


# Close the database
mongo.disconnect(mongo)
