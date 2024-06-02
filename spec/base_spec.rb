require 'spec_helper'

# Array of all generated pages
site = File.join(File.dirname(__FILE__), '..', '_site', '**', '*.html')
PAGES = Dir.glob(site).map{ |p| p.gsub(/[^_]+\/_site(.*)/, '\\1') }

PAGES.each do |p|
  describe p do
    
    page_extension = p.to_s
    if page_extension.start_with?("/flag_status_viewer") == false
    it_behaves_like 'Sea Florida Change Webpage'
    end

    page_extension = p.to_s
    if page_extension.start_with?("/flag_status_viewer") == true
    it_behaves_like 'Flag Status Viewer Webpage'
    end
    
    page_extension = p.to_s
    if page_extension.start_with?("/communities") == true
    it_behaves_like 'Location Page'
    end

    before :each do
      visit p
    end
  end
end
