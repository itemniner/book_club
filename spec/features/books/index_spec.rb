require 'rails_helper'

RSpec.describe "books index page", type: :feature do
  it "can see each book in the system including the books information" do
    mad_lib = Book.create(title:       "Mad Lib",
                          pages:      40,
                          publication_year:  2010
                          )
    dictionary = Book.create(title:       "Dictionary",
                             pages:      40,
                             publication_year:  2010 
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
    
    visit "/books"
    
    within("#books-#{mad_lib.id}") do
      expect(page).to have_content(mad_lib.title)
      expect(page).to have_content(mad_lib.pages)
      expect(page).to have_content(mad_lib.publication_year)
      expect(page).to have_content(tony.name)
      expect(page).to have_content(jim.name)
      expect(page).to_not have_content(alfredo.name)
    end
 
    within("#books-#{dictionary.id}") do
      expect(page).to have_content(dictionary.title)
      expect(page).to have_content(dictionary.pages)
      expect(page).to have_content(dictionary.publication_year)
      expect(page).to have_content(alfredo.name)
    end
  end
end
