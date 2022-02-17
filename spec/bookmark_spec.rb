require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      bookmark = Bookmark.create("Makers", "http://www.makersacademy.com")

      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Makers'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
    end
    
  end

  describe '#create' do
    it 'Saved a new bookmark to the bookmarks table' do
      bookmark = Bookmark.create("Makers", "http://www.makersacademy.com")
      expect(bookmark.title).to eq("Makers")
      expect(bookmark.url).to eq("http://www.makersacademy.com")
    end
  end

end