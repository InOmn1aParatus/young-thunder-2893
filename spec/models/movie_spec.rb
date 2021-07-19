require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
  end

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
    MovieActor.create(actor: @cage, movie: @raiders)
    MovieActor.create(actor: @jill, movie: @raiders)
  end

  describe 'methods' do
    it 'calculates average actor age' do
      expect(@raiders.avg_actor_age).to eq(49.5)
    end
  end
end