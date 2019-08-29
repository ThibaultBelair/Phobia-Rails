# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seed start..."

Phobia.destroy_all
Image.destroy_all

phobias_attributes = [
  {
    name:'Spider',
    keywords: ['Spider', 'Web', 'Aranea', 'Black widow', 'Arachnoid', 'Theridiid', 'Araneida', 'Tarentula', 'Araignée'],
  },
  {
    name:'Snake',
    keywords: ['Snake', 'Venom', 'Reptile'],
  }
]

images_attributes = [
  {
    urls:['https://img.lemde.fr/2016/12/01/0/0/2250/1500/688/0/60/0/d0530c1_7640-1p0efxb.4ogsnhfr.JPG', 'https://img.lemde.fr/2017/08/03/0/0/3198/2976/688/0/60/0/7e8a69c_14438-jpx6uv.jpv00vbo6r.jpg'],
    keywords: ['Spider', 'Araignée', 'Leaf spider', 'Celaenia excavata'],
  },
  {
    urls:['https://media.mnn.com/assets/images/2019/08/baby_jumping_spider.jpg'],
    keywords: ['Spider', 'Araignée', 'Arachnid'],
  },
  {
    urls:['https://img.lemde.fr/2019/03/19/0/0/4237/2825/688/0/60/0/df70090_v9Bvi2-hWy02C-JQRW1xHs6J.jpg'],
    keywords: ['Snake', 'Serpent', 'Chepchirchir kiplagat'],
  }
]

Phobia.create!(phobias_attributes)
Image.create!(images_attributes)

puts "seed ok!"
