# Every page that is accessible by users should contain the word "Florida" within it.
RSpec.shared_examples_for 'Page' do
    it "has Florida text" do
      expect(page).to have_text("Florida")
    end
  end