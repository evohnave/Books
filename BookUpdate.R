################################################################################
###                                                                          ###
###     New Version!                                                         ###
###                                                                          ###
################################################################################

# Note: ğ must be encoded manually as \\u011f, İ as \\u0130, ı as \\u0131

# Data input section

lastName <- "ğĞüÜşŞİıöÖçÇ"
firstName <- "first names"
title <- "Title"
ISBN13 <- "978-3-926195-06-7"
cover <- "hard cover"
publisher <- "Sumer Kitabevi"
coverPictureURL <- "http://www.boyutstore.com/ProductImages/90868/big/byg.shfy.00718.jpg"
copyright <- 1993
datePublished <- "January 1993"
place <- "New York"
lccn <- "93-12345"
location  <- "Eric"
price <- 50.00

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
              copyright, datePublished, place, lccn, location, price, '}',
              sep = "")
validate(book)
prettify(book)
insertOne(mongo, coll, book)

#          "translator" : {"lastName" : "Tzamali", "firstName" : "Marion"},
