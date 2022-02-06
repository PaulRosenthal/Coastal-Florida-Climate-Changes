# Every page that is accessible by users should contain the word "Florida" within it.
RSpec.shared_examples_for 'Page' do
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

RSpec.shared_examples_for 'Location Page' do
  it 'has a sea level visualization map' do
    expect(page).to have_text("Visualize Sea Level Change in")
  end
end