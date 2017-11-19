require 'rails_helper'

feature 'Manage tasks', js: true do
  scenario 'add a new song' do
    # Point your browser towards the todo path
    artist_id = Artist.first.id

    visit artist_path(artist_id)

    # Enter description in the text field
    fill_in 'song_name', with: 'BlaBla'
    fill_in 'album_name', with: 'BlaBla'
    fill_in 'release_date', with: '1989'


    # Press enter (to submit the form)
    page.execute_script("$('form').submit()")

    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('BlaBla')
  end
end
