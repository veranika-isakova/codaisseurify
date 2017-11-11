User.destroy_all
Song.destroy_all
Artist.destroy_all

#users
valerii = User.create!(
  email: 'valerii@gmail.com',
  password: '123456'
)

anna = User.create!(
  email: 'anna@gmail.com',
  password: '123456'
)

#artists
bob_dylan = Artist.create!(
  name: "Bob Dylan",
  country: "USA",
  biography: "Folk rock singer-songwriter Bob Dylan was born Robert Allen Zimmerman on May 24, 1941, in Duluth, Minnesota. While attending college, he began performing folk and country songs, taking the name \"Bob Dylan\" In 1961 Dylan signed his first recording contract, and he emerged as one of the most original and influential voices in American popular music. Dylan has continued to tour and release new studio albums, including Together Through Life (2009), Tempest (2012), Shadows in the Night (2015) and Fallen Angels (2016). The legendary singer-songwriter has received Grammy, Academy and Golden Globe awards, as well as the Presidential Medal of Freedom and the Nobel Prize for Literature.",
  official_site: "http://bobdylan.com/"
  )
radiohead = Artist.create!(
  name: "Radiohead",
  country: "England",
  biography: "English rock band from Abingdon, Oxfordshire, formed in 1985. The band consists of Thom Yorke (vocals, guitar, piano, keyboards), Ed O'Brien (guitar, backing vocals), Phil Selway (drums, percussion, backing vocals), and brothers Jonny Greenwood (lead guitar, keyboards, other instruments) and Colin Greenwood (bass).",
  official_site: "https://www.radiohead.com/"
)
nirvana = Artist.create!(
  name: "Nirvana",
  country: "USA",
  biography: "American rock band formed by singer and guitarist Kurt Cobain and bassist Krist Novoselic in Aberdeen, Washington, in 1987. Nirvana went through a succession of drummers, the longest-lasting being Dave Grohl, who joined in 1990. Despite releasing only three full-length studio albums in their seven-year career, Nirvana has come to be regarded as one of the most influential and important alternative bands in history. Though the band dissolved in 1994 after the death of Cobain, their music maintains a popular following and continues to influence modern rock and roll culture.",
  official_site: "http://www.nirvana.com/"
)
the_xx = Artist.create!(
  name: "The xx",
  country: "England",
  biography: "English indie pop band formed in 2005 in Wandsworth, London[4] which currently consists of Romy Madley Croft (guitar, vocals), Oliver Sim (bass, vocals) and Jamie Smith also known as Jamie xx (beats, MPC, record production). They are best known for their distinct and unique minimalistic sound that blends the likes of indie pop, indie electronic, dream pop and electronic rock and the dual vocalist setup of both Croft and Sim. Their music employs very soft, echoed guitar, prominent bass, light electronic beats and ambient soundscape backgrounds.",
  official_site: "http://thexx.info/"
)
#songs
song_1 = Song.create!(
  song_name: "Knocking on heaven's door",
  album_name: "Pat Garrett & Billy the Kid",
  release_date: 1973,
  artist: bob_dylan
)
song_2 = Song.create!(
  song_name: "Creep",
  album_name: "Pablo Honey",
  release_date: 1993,
  artist: radiohead
)
song_3 = Song.create!(
  song_name: "Street Spirit",
  album_name: "The Bends",
  release_date: 1995,
  artist: radiohead
)
song_4 = Song.create!(
  song_name: "Smells Like Teen Spirit ",
  album_name: "Nevermind",
  release_date: 1991,
  artist: nirvana
)
song_5 = Song.create!(
  song_name: "In Bloom",
  album_name: "Nevermind",
  release_date: 1991,
  artist: nirvana
)
song_6 = Song.create!(
  song_name: "Basic Space",
  album_name: "XX",
  release_date: 2009,
  artist: the_xx
)
#photos
photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510427478/Bob-Dylan-Picture-1960s-Style-Sunglasses_j4dbks.jpg", artist: bob_dylan)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510428117/a276a56ab39b41f68ce338cee2f6a275_qvyi88.jpg", artist: radiohead)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510428156/vgupa0jpkeie0wr0j8er_c4c6oj.jpg", artist: nirvana)
photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510428057/thexxTOL260110_o5osj3.jpg", artist: the_xx)
