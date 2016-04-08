

destinations = Destination.create([
  {city: "Portland", state: "Oregon", country: "United States", continent: "North America"},
  {city: "New York", state: "New York", country: "United States", continent: "North America"},
  {city: "Paris", country: "France", continent: "Europe"},
  {city: "Marrakesh", country: "Morocco", continent: "Africa"},
  {city: "Casablanca", country: "Morocco", continent: "Africa"},
  {city: "Istanbul", country: "Turkey", continent: "Asia"},
  {city: "Cartagena", country: "Columbia", continent: "South America"}
  ])


category_activities = CategoryActivity.create([
  {activity_id: 1, category_id: 2},
  {activity_id: 2, category_id: 5},
  {activity_id: 3, category_id: 2},
  {activity_id: 4, category_id: 2},
  {activity_id: 5, category_id: 2},
  {activity_id: 6, category_id: 1},
  {activity_id: 7, category_id: 2},
  {activity_id: 8, category_id: 4},
  {activity_id: 9, category_id: 3},
  {activity_id: 10, category_id: 5},
  {activity_id: 11, category_id: 4},
  {activity_id: 12, category_id: 4},
  {activity_id: 13, category_id: 1},
  {activity_id: 14, category_id: 1},
  {activity_id: 15, category_id: 4},
  {activity_id: 16, category_id: 2},
  {activity_id: 17, category_id: 2},
  {activity_id: 18, category_id: 3},
  {activity_id: 9, category_id: 6},
  {activity_id: 18, category_id: 4}
  ])

activities = Activity.create([
  {destination_id: 1, name: "Toro Bravo", link: "http://www.torobravopdx.com/"},
  {destination_id: 1, name: "Powell's Bookstore", link: "http://www.powells.com/"},
  {destination_id: 1, name: "Por Que No", link: "http://www.porquenotacos.com/"},
  {destination_id: 1, name: "Japanese Gardens", link: "http://japanesegarden.com/"},
  {destination_id: 1, name: "Voodoo Doughnut", link: "http://voodoodoughnut.com/"},
  {destination_id: 1, name: "The Crystal Ballroom", link: "http://www.mcmenamins.com/CrystalBallroom"},
  {destination_id: 1, name: "Ava Gene's", link: "http://avagenes.com/"},
  {destination_id: 1, name: "Oregon Museum of Science and Industry", link: "http://www.omsi.edu/"},
  {destination_id: 1, name: "Multnomah Falls", link: "http://www.oregon.com/attractions/multnomah_falls"},
  {destination_id: 3, name: "Champs Elysees", link: "https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=champs+elysees"},
  {destination_id: 3, name: "The Louvre", link: "http://www.louvre.fr/en"},
  {destination_id: 3, name: "Père Lachaise", link: "http://www.pere-lachaise.com/perelachaise.php?lang=en"},
  {destination_id: 3, name: "Moulin Rouge", link: "http://www.moulinrouge.fr/?lang=en"},
  {destination_id: 3, name: "L'Olympia Bruno Coquatrix", link: "http://www.olympiahall.com/"},
  {destination_id: 3, name: "Centre Pompidou", link: "https://www.centrepompidou.fr/"},
  {destination_id: 3, name: "Epicure", link: "http://www.lebristolparis.com/eng/gastronomy/epicure/#_=_"},
  {destination_id: 3, name: "Le Potager du Marais", link: "http://www.lepotagerdumarais.fr/Potager_du_Marais/Le_Potager_du_Marais.html"},
  {destination_id: 4, name: "Djemma el Fna", link: "http://www.morocco.com/attractions/djemaa-el-fna/"}
  ])

categories = Category.create([
  {name: "Music"},
  {name: "Restaurants"},
  {name: "Active"},
  {name: "Cultural"},
  {name: "Shopping"},
  {name: "Spa/Fitness"}
  ])
  

users = User.create([
  {name: "Greta", email: "greta@email.com", location: "New York", age: '1980-01-02'},
  {name: "Joe", email: "joe@email.com", location: "Miami", age: '1981-01-03'},
  {name: "Danny", email: "danny@email.com", location: "Toronto", age: '1982-01-04'},
  {name: "Mal", email: "mal@email.com", location: "Boston", age: '1983-01-05'}
  ])


trips = Trip.create([
  {title: "Mal's Trip to Portland", user_id: 4},
  {title: "Joe's Trip to New York", user_id: 2},
  {title: "Greta's Trip to Paris", user_id: 1},
  {title: "Danny's Trip to Morocco", user_id: 3}
  ])
  












