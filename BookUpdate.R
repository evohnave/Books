################################################################################
###                                                                          ###
###     New Version!                                                         ###
###                                                                          ###
################################################################################

source(file = "MainScript.R")
# Note: ğ must be encoded manually as \\u011f, İ as \\u0130, ı as \\u0131

# Data input section

lastName <- "Retowski"
firstName <- "Otto W."
title <- "Die M\\U00FCnzen Der Komnenen Von Trapezunt"
ISBN13 <- NULL
cover <- "Hard Cover"
publisher <- "Klinkhardt & Biermann"
coverPictureURL <- "https://images.vcoins.com/product_image/9/F/6/fHL5Y2qi7cADJ4Jk9NbrN6FgpC3XYZ.jpg"
copyright <- 1974
datePublished <- "January 1974"
place <- "Braunschweig"
lccn <- NULL
location  <- "Eric"
price <- 64.83
edition <- 2

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
edition <- paste(', "Edition" : ', edition, sep = "")

book <- paste('{', author, title, ISBN13, purchaseId, cover, coverPicture,
              publisher, copyright, datePublished, place, lccn, location, 
              price, edition, '}',
              sep = "")
# book <- paste('{', author, title, ISBN13, purchaseId, cover, coverPicture,
#               copyright, datePublished, place, location, price, '}',
#               sep = "")
validate(book)
prettify(book)
insertOne(mongo, coll, book)

#          "translator" : {"lastName" : "Tzamali", "firstName" : "Marion"},
