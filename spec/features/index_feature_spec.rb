
 require 'pg'
feature 'index page' do
  scenario 'welcomes you to Chitter on index page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

  scenario 'allows user to enter message and submit' do
    visit('/')
    fill_in 'message', with: 'Peep me'
    click_button 'Peep'
  end

  scenario 'user can post message on page'do
  visit('/')
  fill_in 'message', with: 'Peep me'
  click_button 'Peep'
  expect(page).to have_content("Peep me")
  fill_in 'message', with: 'Fudge this'
  click_button 'Peep'
  expect(page).to have_content("Fudge this")
  end

  scenario 'viewing message from database on page' do
    connection = PG.connect(dbname: 'peep_log_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('Peep me');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Fudge this');")

    visit('/')
    expect(page).to have_content('Peep me')
    expect(page).to have_content('Fudge this')
  end

end
