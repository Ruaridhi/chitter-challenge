require 'pg'

class PostPeep

  def self.show

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peep_log_test')
    else
      connection = PG.connect(dbname: 'peep_log')
    end
    
    list = connection.exec 'SELECT * FROM peeps'
    list.map { |peep| peep['message'] }

  end

end
