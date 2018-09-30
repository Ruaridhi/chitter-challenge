require 'pg'

def test_setup
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec 'TRUNCATE TABLE bookmarks'
end
