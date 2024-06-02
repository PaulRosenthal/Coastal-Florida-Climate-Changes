RSpec.shared_examples_for 'Sea Florida Change Webpage' do
  it 'renders correctly' do
    expect(page.status_code).to be(200)
  end
  it 'has the word Florida on the page' do
      expect(page).to have_text("Florida")
  end
  it 'contains the date the website was last published' do
    expect(page).to have_text("This website was last published on")
  end
end

RSpec.shared_examples_for 'Flag Status Viewer Webpage' do
  # There are no tests for the Flag Status Viewer application. They are tested within
  # that application's "App.test.js" file.
end

RSpec.shared_examples_for 'Location Page' do
  it 'has a statement about sea level impacts' do
    expect(page).to have_text("Sea Levels Impact")
  end
  it 'contains a sea level visualization map' do
    expect(page).to have_selector('div', id: 'FLCoastMap')
  end
end
