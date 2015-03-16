# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fruit_array = ['apple', 'orange', 'banana', 'pineapple']
20.times do
	species = fruit_array[(rand*(fruit_array.length-1)).round]
	organic = (rand>0.5)
	type_id = (rand*1000).round
	description = Faker::Lorem.sentences(10)
	owner = Faker::Name.name
	title = Faker::Commerce.product_name
  #Types.create(title: title, description: description)
	Fruit.create(species: species, organic: organic, type_id: type_id, description: description, owner: owner, title: title)
end



 # t.string :species
 #      t.boolean :organic
 #        	add_column :fruits, :title, :string
 #  	add_column :fruits, :description, :text
 #  	add_column :fruits, :owner, :text
 #  	add_column :fruits, :type_id, :integer