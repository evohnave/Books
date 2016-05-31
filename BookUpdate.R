################################################################################
###                                                                          ###
###     New Version!                                                         ###
###                                                                          ###
################################################################################

source(file = "MainScript.R")
# Note: ğ must be encoded manually as \\u011f, İ as \\u0130, ı as \\u0131

# Data input section

lastName <- "Clare"
firstName <- "Cassandra"
title <- "City Of Ashes"
ISBN13 <- "978-1-4814-5597-8"
cover <- "Paperback"
  publisher <- "Margaret K. McElderry Books"
coverPictureURL <- "http://ecx.images-amazon.com/images/I/51%2BULZ5O8jL.jpg"
copyright <- 2008
datePublished <- "September 2015"
place <- "New York"
lccn <- 2007014714
location  <- "Helen"
price <- 10.67

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
