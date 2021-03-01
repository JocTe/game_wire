# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "------Cleaning Games db------"
Game.destroy_all
puts "------Cleaning Users db------"
User.destroy_all

puts "------Creating Users------"
jo = User.create!(first_name: "Jo", last_name: "Jordi", username: "JoJo", email:"jo@something.com", address: "3 rue dans ton coeur", password: "545454")
alexis = User.create!(first_name: "Alex", last_name: "Bibop", username: "Al", email:"al@something.com", address: "5 place des enjolivé", password: "545454")
morgane = User.create!(first_name: "Morgane", last_name: "Moma", username: "Mormor", email:"mo@something.com", address: "17 boulevard des cappucines", password: "545454")

users = [jo, alexis, morgane]



puts "------Creating Games------"

wazabi = { name: "Wazabi", description: "Un seul objectif : vous débarrasser de vos dés ! Des cartes vont vous y aider, mais pour les utiliser il vous faudra obtenir les bonnes figures avec les dés.", user: jo }
bang = { name: "Bang", description: "BANG! recrée les fusillades des westerns spaghettis et fait s’affronter un groupe de Hors-la-loi et un Shérif. Les Adjoints tentent d’aider le Shérif incognito, mais il existe aussi un Renégat qui poursuit ses propres objectifs !", user: jo }
degoblinade = { name: "Degoblinade", description: "Dégoblinade est un jeu de cartes et de dés vous permettant de lever une armée de gobelins pour anéantir les clans adverses. Attaquez vos opposants, défendez votre peau, pactisez avec l'ennemi, trahissez vos alliés : Tous les coups sont permis pour devenir le Roi des gobelins!", user: morgane}
codenames = { name: "Codenames", description: "Codenames est un jeu d’association d’idées dans lequel les joueurs, répartis en deux équipes, devront tour à tour faire deviner à leurs coéquipiers un ensemble de mots qui leur sont attribués. Une seule règle : faire deviner avec un seul indice et un chiffre correspondant au nombre de mots à trouver. Prenez donc garde de ne pas découvrir les mots de vos concurrents ou pire … le mot Piège.", user: jo }
themind = { name: "The name" , description: "Les joueurs doivent poser leurs cartes par ordre croissant au centre de la table. Il n’y a pas d’ordre de jeu : qui pense avoir la plus petite carte la pose en premier et ainsi de suite. On ne peut ni parler, ni se faire des signes, ni communiquer d’aucune manière ! Et pourtant, le succès est possible.", user: morgane }
timebomb = { name: "Time Bomb", description: "Moriarty a caché une bombe dans la plus célèbre tour de Londres. Lui et son équipe cherchent à la faire exploser et Scherlock et ses amis font tout pour contrecarrer ce plan.", user: alexis }
colt = {name:"Colt Express", description: "L’esprit des grands westerns dans un jeu de programmation original et subtil. Des cartes événement révélées au début de chaque manche introduisant nouvelles règles ou changements de situation.", user: alexis }

games = [wazabi, bang, degoblinade, codenames, themind, timebomb, colt ]

games.each do |game|
   Game.create!(game)
end
puts "------Done------"
