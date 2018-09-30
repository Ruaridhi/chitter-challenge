require 'chitter'

describe PostPeep do

  it 'accepts a post method' do
    expect(PostPeep).to respond_to(:post)
  end

  it 'posts a peep to the database' do
    connection = PG.connect(dbname: 'peep_log_test')
    PostPeep.post('Get in')
    expect(PostPeep.show).to include 'Get in'
  end

  it 'database reveals data within' do
    connection = PG.connect(dbname: 'peep_log_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('Peep me');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Fudge this');")
    expect(PostPeep.show).to include 'Peep me'
    expect(PostPeep.show).to include 'Fudge this'
  end

end
