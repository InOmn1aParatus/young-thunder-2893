require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @universal = Studio.create(
      name: 'Universal Studios', location: 'Hollywood'
    )
    @raiders = @universal.movies.create(
      title: 'Raiders of the Lost Ark',
      creation_year: 1981,
      genre: 'Action/Adventure'
    )
  end

  it 'Displays list of studios with their details' do
    visit '/studios'

    expect(page).to have_content('Universal Studios')
    expect(page).to have_content('Hollywood')
    expect(page).to have_content('Raiders of the Lost Ark')
  end
  # When I visit the studio index page
  # I see a each studio's name and location
  # And underneath each studio, I see the titles of all of its movies.
end