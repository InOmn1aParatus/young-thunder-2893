universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
raiders = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
shrek = universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

cage = Actor.create(
  name: 'Nic Cage',
  age: 50
)
jill = Actor.create(
  name: 'Jill Jillian',
  age: 49
)
jo = Actor.create(
  name: 'Scarlett Jo',
  age: 40
)
adam = Actor.create(
  name: 'Adam Dude',
  age: 30
)

MovieActor.create(actor: cage, movie: raiders)
MovieActor.create(actor: jill, movie: raiders)
MovieActor.create(actor: jo, movie: shrek)
MovieActor.create(actor: adam, movie: shrek)