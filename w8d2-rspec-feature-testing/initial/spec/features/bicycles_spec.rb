require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Bicycle index", type: :feature, js: true do

  before :each do
    @bike1 = FactoryBot.create(:bicycle,
      brand: FactoryBot.create(:brand, name: 'Brand', country: 'Canada'),
      style: FactoryBot.create(:style, name: 'Fixie'),
      speeds: 1,
      colour: 'Red',
      model: 'Moustache'
    )
    @bike2 = FactoryBot.create(:bicycle,
      brand: FactoryBot.create(:brand, name: 'Hildebrand', country: 'USA'),
      style: FactoryBot.create(:style, name: 'Hybrid'),
      speeds: 10,
      colour: 'Black',
      model: 'Roadmeister'
    )
  end

  scenario "Lists all bikes" do
    visit "/bicycles"

    expect(page).to have_css('.bicycle', count: 2)
    expect(page).to have_text('Red Brand Moustache Fixie', count: 1)
    expect(page).to have_text('Black 10-speed Hildebrand Roadmeister Hybrid', count: 1)
    save_screenshot('all_bikes.png')
  end

end
