# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(name: 'Michelangelo',
    description: 'mais conhecido simplesmente como Michelangelo ou Miguel Ângelo, foi um pintor, escultor, poeta, anatomista e arquiteto italiano, considerado um dos maiores criadores da história da arte do ocidente.')

Artist.create(name: 'Leonardo da Vinci',
    description: 'Leonardo di Ser Piero da Vinci, ou simplesmente Leonardo da Vinci, foi um polímata nascido na atual Itália, uma das figuras mais importantes do Alto Renascimento, que se destacou como cientista, matemático, engenheiro, inventor, anatomista, pintor, escultor, arquiteto, botânico, poeta e músico.')


ArtStyle.create(name:'Renascentista', 
    description:'Na arte renascentista, a escultura e pintura, foram desprendidas da arquitetura. Nas principais características da arte renascentista na arquitetura está o círculo como modelo centralizador dos templos com a cúpula.')

Painting.create(name:'A criação de Adão', artist_id:'1', art_style_id:'1', 
    description:'A Criação de Adão é um fresco de 280 cm x 570 cm, pintado por Michelangelo Buonarotti por volta de 1511, que fica no teto da Capela Sistina. A cena representa um episódio do Livro do Gênesis no qual Deus cria o primeiro homem: Adão.', year:'1508-1515')

pintura1 = Painting.first
#pintura1.image.attach(io: File.open('./public/a-criacao-de-adao-michelangelo-og.jpeg'), filename:'a-criacao-de-adao-michelangelo-og.jpeg')

