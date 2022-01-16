require 'spec_helper'

# Array of all generated pages
site = File.join(File.dirname(__FILE__), '..', '_site', '**', '*.html')
PAGES = Dir.glob(site).map{ |p| p.gsub(/[^_]+\/_site(.*)/, '\\1') }

PAGES.each do |p|
  describe p do
    it_behaves_like 'Page'
    # it_behaves_like 'Page with search box' unless p == '/search.html'

    before :each do
      visit p
    end
  end
end