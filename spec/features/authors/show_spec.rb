require 'rails_helper'

RSpec.describe "author show page", type: :feature do
  it "can click author link and be taken to author show page" do 

    mad_lib = Book.create(title:               "Mad Lib",
                          pages:                40,
                          publication_year:     2010
                          )
    dictionary = Book.create(title:            "Dictionary",
                             pages:             40,
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

    

    click_on "#{jim.name}"

    expect(current_path).to eq("/authors/#{jim.id}")  
    expect(page).to have_content(jim.name)
    expect(page).to have_content(mad_lib.title)
    expect(page).to have_content(jim.average_page_of_books)
    expect(jim.average_page_of_books).to eq(40)
    expect(page).to_not have_content(alfredo.name)
    expect(page).to_not have_content(tony.name)
    expect(page).to_not have_content(dictionary.title)
  end
end
