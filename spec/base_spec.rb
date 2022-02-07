require 'spec_helper'

# Array of all generated pages
site = File.join(File.dirname(__FILE__), '..', '_site', '**', '*.html')
PAGES = Dir.glob(site).map{ |p| p.gsub(/[^_]+\/_site(.*)/, '\\1') }

PAGES.each do |p|
  describe p do
    it_behaves_like 'Page'
    
    page_extension = p.to_s
    if page_extension.start_with?("/communities") == true
      it_behaves_like 'Location Page'
      puts "{p} is a page that starts with /communities."
      end

    before :each do
      visit p
    end
  end
end