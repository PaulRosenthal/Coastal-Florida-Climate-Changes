require 'spec_helper'

# Array of all generated pages
site = File.join(File.dirname(__FILE__), '..', '_site', '**', '*.html')
PAGES = Dir.glob(site).map{ |p| p.gsub(/[^_]+\/_site(.*)/, '\\1') }

PAGES.each do |p|
  describe p do
    it_behaves_like 'Page'
    
    if p.start_with?("/communities/") == 1
      # it_behaves_like 'Location Page'
      it 'has a sea level visualization map' do
        expect(page).to have_text("Visualize Sea Level Change in")
      end
    end

    before :each do
      visit p
    end
  end
end