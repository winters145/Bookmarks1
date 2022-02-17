require 'pg'

class Bookmark
  def self.all
    database_connect
    result = @connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(bookmark)
    database_connect
    @connection.exec("INSERT INTO bookmarks(url) VALUES('#{bookmark}')")
  end

  private

  def self.database_connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end