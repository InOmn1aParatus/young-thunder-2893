universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

cage = Actor.create(
  name: 'Nic Cage',
  age: 50
)
jo = Actor.create(
  name: 'Scarlett Jo',
  age: 40
)
adam = Actor.create(
  name: 'Adam Dude',
  age: 30
)