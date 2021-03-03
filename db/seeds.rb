# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "------Cleaning Games db------"
Game.destroy_all
puts "------Cleaning Users db------"
User.destroy_all
puts "------Cleaning Bookings db------"
Booking.destroy_all


puts "------Creating Users------"
jo = User.create!(first_name: "Jo", last_name: "Jordi", username: "JoJo", email:"jo@something.com", address: "3 rue dans ton coeur", password: "545454")
alexis = User.create!(first_name: "Alex", last_name: "Bibop", username: "Al", email:"al@something.com", address: "5 place des enjolivé", password: "545454")
morgane = User.create!(first_name: "Morgane", last_name: "Moma", username: "Mormor", email:"mo@something.com", address: "17 boulevard des cappucines", password: "545454")

users = [jo, alexis, morgane]


puts "------Creating Pictures------"
wazabiPicture = URI.open('https://www.fantastik.fr/30065-large_default/jeux-de-societe-wazabi.jpg')
bangPicture = URI.open('https://www.espritjeu.com/upload/image/bang---p-image-46524-grande.jpg')
degoblinadePicture = URI.open('https://www.espritjeu.com/upload/image/degoblinade-p-image-67449-grande.jpg')
codenamesPicture = URI.open('https://cdn3.philibertnet.com/353015-thickbox_default/codenames-vf.jpg')
themindPicture = URI.open('https://cdn3.philibertnet.com/401610-thickbox_default/the-mind.jpg')
timebombPicture = URI.open('https://images-na.ssl-images-amazon.com/images/I/71HOag4RiLL._AC_SL1404_.jpg')
coltPicture = URI.open('https://www.espritjeu.com/upload/image/colt-express-p-image-67865-grande.jpg')

puts "------Creating Games------"

wazabi = Game.create!(name: "Wazabi", price:6, number_of_players:8, duration:"2000-01-01 00:45:00", description: "Un seul objectif : vous débarrasser de vos dés ! Des cartes vont vous y aider, mais pour les utiliser il vous faudra obtenir les bonnes figures avec les dés.", user: jo)
bang = Game.create!(name: "Bang", price:10, number_of_players:4, duration:"2000-01-01 00:30:00", description: "BANG! recrée les fusillades des westerns spaghettis et fait s’affronter un groupe de Hors-la-loi et un Shérif. Les Adjoints tentent d’aider le Shérif incognito, mais il existe aussi un Renégat qui poursuit ses propres objectifs !", user: jo)
degoblinade = Game.create!(name: "Degoblinade", price:7, number_of_players:6, duration:"2000-01-01 00:40:00", description: "Dégoblinade est un jeu de cartes et de dés vous permettant de lever une armée de gobelins pour anéantir les clans adverses. Attaquez vos opposants, défendez votre peau, pactisez avec l'ennemi, trahissez vos alliés : Tous les coups sont permis pour devenir le Roi des gobelins!", user: morgane)
codenames = Game.create!(name: "Codenames", price:5, number_of_players:10, duration:"2000-01-01 00:35:00", description: "Codenames est un jeu d’association d’idées dans lequel les joueurs, répartis en deux équipes, devront tour à tour faire deviner à leurs coéquipiers un ensemble de mots qui leur sont attribués. Une seule règle : faire deviner avec un seul indice et un chiffre correspondant au nombre de mots à trouver. Prenez donc garde de ne pas découvrir les mots de vos concurrents ou pire … le mot Piège.", user: jo)
themind = Game.create!(name: "The name" , price:2, number_of_players:4, duration:"2000-01-01 00:20:00", description: "Les joueurs doivent poser leurs cartes par ordre croissant au centre de la table. Il n’y a pas d’ordre de jeu : qui pense avoir la plus petite carte la pose en premier et ainsi de suite. On ne peut ni parler, ni se faire des signes, ni communiquer d’aucune manière ! Et pourtant, le succès est possible.", user: morgane)
timebomb = Game.create!(name: "Time Bomb", price:10, number_of_players:8, duration:"2000-01-01 00:35:00", description: "Moriarty a caché une bombe dans la plus célèbre tour de Londres. Lui et son équipe cherchent à la faire exploser et Scherlock et ses amis font tout pour contrecarrer ce plan.", user: alexis)
colt = Game.create!(name:"Colt Express", price:5, number_of_players:6, duration:"2000-01-01 00:35:00", description: "L’esprit des grands westerns dans un jeu de programmation original et subtil. Des cartes événement révélées au début de chaque manche introduisant nouvelles règles ou changements de situation.", user: alexis)

wazabi.photo.attach(io: wazabiPicture, filename: 'wazabi.jpg', content_type: 'image/jpg')
bang.photo.attach(io: bangPicture, filename: 'bang.jpg', content_type: 'image/jpg')
degoblinade.photo.attach(io: degoblinadePicture, filename: 'degoblinade.jpg', content_type: 'image/jpg')
codenames.photo.attach(io: codenamesPicture, filename: 'codenames.jpg', content_type: 'image/jpg')
themind.photo.attach(io: themindPicture, filename: 'themind.jpg', content_type: 'image/jpg')
timebomb.photo.attach(io: timebombPicture, filename: 'timebomb.jpg', content_type: 'image/jpg')
colt.photo.attach(io: coltPicture, filename: 'colt.jpg', content_type: 'image/jpg')

puts "------Creating Bookings------"

Booking.create!(user: jo, game:timebomb, start_at: Date.new(2021,03,02), end_at: Date.new(2021,03,05), state:"pending")
Booking.create!(user: jo, game:themind, start_at: Date.new(2021,03,07), end_at: Date.new(2021,04,07), state:"accepted")
Booking.create!(user: alexis, game:degoblinade, start_at: Date.new(2021,03,02), end_at: Date.new(2021,03,05), state:"pending")
Booking.create!(user: morgane, game:timebomb, start_at: Date.new(2021,03,02), end_at: Date.new(2021,03,05), state:"refused")

puts "------Done------"
