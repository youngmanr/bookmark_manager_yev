feature 'creating links' do
  scenario 'user would like to save the website to bookmark' do
    visit '/links/new'
    fill_in :url, with: 'http://www.makersacademy.com'
    fill_in :title, with: 'Makers Academy'
    click_button 'Add bookmark'
    expect(current_path).to eq ('/links')
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
