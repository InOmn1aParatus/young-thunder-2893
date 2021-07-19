require 'rails_helper'

RSpec.describe 'Movie show page' do
  before :each do
    @universal = Studio.create(
      name: 'Universal Studios', location: 'Hollywood'
    )
    @raiders = @universal.movies.create(
      title: 'Raiders of the Lost Ark',
      creation_year: 1981,
      genre: 'Action/Adventure'
    )
    @cage = Actor.create(
      name: 'Nic Cage',
      age: 50
    )
    @jill = Actor.create(
      name: 'Jill Jillian',
      age: 49
    )
    @jo = Actor.create(
      name: 'Scarlett Jo',
      age: 40
    )
    MovieActor.create(actor: @cage, movie: @raiders)
    MovieActor.create(actor: @jill, movie: @raiders)
  end

  it 'lists movie details' do
    visit "/movies/#{@raiders.id}"

    expect(page).to have_content(@raiders.title)
    expect(page).to have_content(@raiders.creation_year)
    expect(page).to have_content(@raiders.genre)
  end

  it 'lists actors from youngest to oldest, and lists avg age' do
    visit "/movies/#{@raiders.id}"

    expect(page).to have_content('Jill Jillian')
    expect(page).to have_content('Nic Cage')
    
    within("#actors") do
      expect(all("#name")[0].text).to eq("Jill Jillian")
      expect(all("#name")[1].text).to eq("Nic Cage")
    end

    expect(page).to have_content("Average actor age: 49.5")
  end

  it 'can add actor to movie' do
    visit "/movies/#{@raiders.id}"

    expect(page).to_not have_content('Scarlett Jo')
    expect(page).to have_content('Add actor to movie')
    save_and_open_page
  end
  # And I see a form to add an actor to this movie
  # When I fill in the form with the name of an actor that exists in the database
  # And I click submit
  # Then I am redirected back to that movie's show page
  # And I see the actor's name is now listed
  # (You do not have to test for a sad path, for example if the name submitted is not an existing actor)
end