# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
    { name: '楽しくなる曲' },
    { name: '元気が出る曲' },
    { name: 'やる気が出る曲'},
    { name: '落ち着く曲'},
    { name: '集中できる曲'},
    { name: '泣ける曲'}
    ])
Type.create([
    { name: '邦楽' },
    { name: '洋楽' },
    { name: 'その他'},
    ])
    
