require 'pg'

feature 'Deleting bookmark' do
  scenario 'A user can delete a bookmark from the table' do
    visit('/bookmarks')
    fill_in('url', with: 'www.test.com')
    fill_in('title', with: 'Test')
    click_button('Create Bookmark')
    expect(page).to have_link("Test", href: "www.test.com")
    click_button('Delete Test')
    expect(page).not_to have_link("Test", href: "www.test.com") 
  end
end