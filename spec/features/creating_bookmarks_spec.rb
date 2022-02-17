require 'pg'

feature 'Creating bookmarks' do
  scenario 'bookmark page has a text field and button to create bookmarks' do
    visit('/bookmarks')
    expect(find_field('url')).to be_truthy
    expect(find_button('Create Bookmark')).to be_truthy
  end

  scenario 'A user can enter a new bookmark into the create bookmark form' do
    visit('/bookmarks')
    fill_in('url', with: 'www.test.com')
    fill_in('title', with: 'Test')
    click_button('Create Bookmark')
    expect(page).to have_link("Test", :href=>"www.test.com")
  end
end

