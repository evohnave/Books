################################################################################
###                                                                          ###
###     New Version!                                                         ###
###                                                                          ###
################################################################################

source(file = "MainScript.R")
# Note: ğ must be encoded manually as \\u011f, İ as \\u0130, ı as \\u0131

# Data input section

lastName <- "Dashner"
firstName <- "James"
title <- "The Death Cure"
ISBN13 <- "978-0-385-73878-1"
cover <- "paperback"
publisher <- "Delacorte Press"
coverPictureURL <- "http://ecx.images-amazon.com/images/I/61cnEiQo1nL.jpg"
copyright <- 2011
datePublished <- "January 2011"
place <- "New York"
lccn <- 2011022236
location  <- "Eric"
price <- 8.47

# Code section
Author1 <- '"author" : {"lastName" : "'
Author2 <- '", "firstName" : "'
Author3 <- '"}, '
author <- paste(Author1, stri_escape_unicode(lastName), 
                Author2, stri_escape_unicode(firstName), Author3, sep = "")
title <- paste('"title" : "', stri_escape_unicode(title), '", ', paste = "")
ISBN13 <- paste('"ISBN13" : "', ISBN13, '", ', sep = "")
purchaseId <- paste('"purchaseId" : ', newPurchaseId(mongo, coll), ', ', sep = "")
cover <- paste('"cover" : "', cover, '", ', sep = "")
publisher <- paste('"publisher" : "', publisher, '", ', sep = "")
coverPicture <- paste('"coverPicture" : "', coverPictureURL, '", ', sep = "")
copyright <- paste('"copyright" : ', copyright, ', ', sep = "")
datePublished <- paste('"datePublished" : "', datePublished, '", ', sep = "")
place <- paste('"place" : "', stri_escape_unicode(place), '", ', sep = "")
lccn <- paste('"lccn" : "', lccn, '", ', sep = "")
location <- paste('"location" : "', location, '", ', sep = "")
price <- paste('"PurchasePrice" : ', price, sep = "")

book <- paste('{', author, title, ISBN13, purchaseId, cover, coverPicture,
              publisher, copyright, datePublished, place, lccn, location, 
              price, '}',
              sep = "")
# book <- paste('{', author, title, ISBN13, purchaseId, cover, coverPicture,
#               copyright, datePublished, place, location, price, '}',
#               sep = "")
validate(book)
prettify(book)
insertOne(mongo, coll, book)

#          "translator" : {"lastName" : "Tzamali", "firstName" : "Marion"},
