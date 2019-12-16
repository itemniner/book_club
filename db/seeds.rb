# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    Book.destroy_all
    Author.destroy_all
    BookAuthor.destroy_all

    mad_lib = Book.create(title:                "Mad Lib",
                          pages:                40,
                          publication_year:     2010
                          )
    dictionary = Book.create(title:             "Dictionary",
                             pages:             40,
                             publication_year:  2010 
                             )
    history = Book.create(title:                "History",
                             pages:             120,
                             publication_year:  2008 
                             )
    

                            
    tony = Author.create(name: "Tony Garcia"
                         )
            
    alfredo = Author.create(name: "Alfredo Ferradas"
                            )

    jim = Author.create(name: "Jim Johnson"
                        )

    BookAuthor.create(book: mad_lib, author: tony)
    BookAuthor.create(book: mad_lib, author: jim)
    BookAuthor.create(book: dictionary, author: alfredo)
    BookAuthor.create(book: history, author: alfredo)
    BookAuthor.create(book: history, author: jim)
    
    