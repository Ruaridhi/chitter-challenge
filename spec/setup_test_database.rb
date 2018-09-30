require 'pg'

def test_setup
  connection = PG.connect(dbname: 'peep_log_test')
  connection.exec 'TRUNCATE TABLE peeps'
end
