# This set of tests checks for the existence of pages that should be present when the website is built.
describe "Home Page" do
    it 'renders correctly' do
      visit '/'
      expect(page.status_code).to be(200)
    end
  end

  describe "Additional Resources Page" do
    it 'renders correctly' do
      visit '/additional-resources'
      expect(page.status_code).to be(200)
    end
  end

  describe "Radar Page" do
    it 'renders correctly' do
      visit '/radar'
      expect(page.status_code).to be(200)
    end
  end

  describe "Contact Me Page" do
    it 'renders correctly' do
      visit '/contact-me'
      expect(page.status_code).to be(200)
    end
  end


  describe "Destin Page" do
    it 'renders correctly' do
      visit 'communities/destin'
      expect(page.status_code).to be(200)
    end
  end
  
    describe "Pensacola Beach Page" do
      it 'renders correctly' do
        visit 'communities/pensacola-beach'
        expect(page.status_code).to be(200)
      end
  end

  describe "Miramar Beach Page" do
    it 'renders correctly' do
      visit 'communities/miramar-beach'
      expect(page.status_code).to be(200)
    end
end

describe "Panama City Beach Page" do
    it 'renders correctly' do
      visit 'communities/panama-city-beach'
      expect(page.status_code).to be(200)
    end
end

describe "Santa Rosa Beach and Highway 30A Page" do
    it 'renders correctly' do
      visit 'communities/santa-rosa-beach-30a'
      expect(page.status_code).to be(200)
    end
end

describe "Fort Walton Beach Page" do
    it 'renders correctly' do
      visit 'communities/fort-walton-beach'
      expect(page.status_code).to be(200)
    end
end

describe "Navarre Beach Page" do
    it 'renders correctly' do
      visit 'communities/navarre-beach'
      expect(page.status_code).to be(200)
    end
end

describe "Custom Location Page" do
    it 'renders correctly' do
      visit 'communities/custom-location'
      expect(page.status_code).to be(200)
    end
  end