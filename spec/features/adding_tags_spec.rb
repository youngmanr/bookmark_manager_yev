feature 'Adding tags' do
  scenario 'User can add tags to the links' do
    visit '/links/new'
    fill_in :url, with: 'http://www.makersacademy.com'
    fill_in :title, with: 'Makers Academy'
    fill_in :tags, with: 'bootcamp'
    click_button 'Add bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('bootcamp')
  end
end