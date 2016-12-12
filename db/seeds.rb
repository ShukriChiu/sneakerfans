# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# users = User.create([
#                     ])

# brands = Brand.create([
#                           { brand_name: 'Nike' },
#                           { brand_name: 'Adidas' },
#                           { brand_name: 'Converse' },
#                           { brand_name: 'Air Jordan' },
#                           { brand_name: 'Vans' },
#                           { brand_name: 'Reebok' },
#                           { brand_name: 'Puma' },
#                           { brand_name: 'New Balance' },
#                           { brand_name: 'Asics' }
#                       ])

# techs = Tech.create([
#                         {
#                             tech_name: 'LUNAR FORCE 1',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Flyknit',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Air Max 90',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Air Force 1',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Air Huarache',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Air Zoom',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'LunarEpic',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Lupinek',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Hyperdunk',
#                             brand_id:  '1'
#                         },
#                         {
#                             tech_name: 'Superstar',
#                             brand_id:  '2'
#                         },
#                         {
#                             tech_name: 'Stan Smith',
#                             brand_id:  '2'
#                         },
#                         {
#                             tech_name: 'EQT',
#                             brand_id:  '2'
#                         },
#                         {
#                             tech_name: 'Tubular radial',
#                             brand_id:  '2'
#                         },
#                         {
#                             tech_name: 'All star',
#                             brand_id:  '3'
#                         },
#                         {
#                             tech_name: 'One star',
#                             brand_id:  '3'
#                         },
#                         {
#                             tech_name: 'Woolrich',
#                             brand_id:  '3'
#                         },
#                         {
#                             tech_name: 'ZX FLUX',
#                             brand_id:  '3'
#                         },
# {
#     tech_name: 'Cortze',
#     brand_id: '3'
# }
#                     ])


articles = Article.create([
                               {
                                   title:   'Converse Classic Cortze Leather QS "Naike"',
                                   techs:   [14,17],
                                   picture: 'http://ohw1pgpd1.bkt.gdipper.com/Converse/Classic_Cortze_Leather_QS_Naike_1.jpg',
                                   address: 'http://ohw1pgpd1.bkt.gdipper.com/Converse/Classic_Cortze_Leather_QS_Naike.md'
                               },
                               {
                                   title:   'Addias ZX 700',
                                   techs:   [12],
                                   picture: 'http://ohw1pgpd1.bkt.gdipper.com/Adidas/ZX_700_1.jpg',
                                   address: 'http://ohw1pgpd1.bkt.gdipper.com/Adidas/ZX_700.md'
                               }
                           ])
