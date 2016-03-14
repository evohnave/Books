# json style

book <- '{"author" : [{"lastName" : "Artuk", "firstName" : "İbrahim"},
                      {"lastName" : "Artuk", "firstName" : "Cevriye"}],
          "title" : "Artukoğulları Sikkeleri",
          "ISBN13" : "978-0883633304",
          "purchaseId" :  '
book2 <- ',
          "cover" : "hard cover",
          "publisher" : "Sümer Kitabevi",
          "coverPicture" : "http://www.boyutstore.com/ProductImages/90868/big/byg.shfy.00718.jpg",
          "copyright" : 1993,
          "datePublished" : "January 1993",
          "place" :  "İstanbul",
          "location" : "Eric",
          "PurchasePrice" : 50.00
         }'

book <- paste(book, newPurchaseId(mongo, coll), book2, sep = "")
validate(book)
prettify(book)
insertOne(mongo, coll, book)

#          "translator" : {"lastName" : "Tzamali", "firstName" : "Marion"},
#          "lccn" : "92-14823",
#          "coverPicture" : "http://ecx.images-amazon.com/images/I/51ZWUV2DEyL.jpg",
