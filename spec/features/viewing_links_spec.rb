
feature 'list of links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end

feature 'filter links by tag' do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.bbc.co.uk', title: 'BBC News', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://www.bubble.co.uk', title: 'Bubble UK', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubbleworld.com', title: 'Bubble Com', tags: [Tag.first_or_create(name: 'bubbles')])
  end
  scenario 'I can filter links by tag' do
    visit 'tags/bubbles'
    expect(page.status_code).to eq (200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('Bubble UK')
      expect(page).to have_content('Bubble Com')
    end
  end
end


