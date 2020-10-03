# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{ name: 'user1', about_me: 'seed data tester', location: 'seed data town name', username: 'user1', password: 'password' }, { name: 'user2', about_me: 'seed data tester', location: 'seed data town name', username: 'user2', password: 'password' }, { name: 'user3', about_me: 'seed data tester', location: 'seed data town name', username: 'user3', password: 'password' }])

invasive_species = InvasiveSpecies.create([
    {common_name: 'Norway Maple', photo: 'no photo available', description: 'Originally native to Europe and western Asia, it was brought to North America as a shade tree in the 1700s and is widely used today.'},
    
    {common_name: 'Mugwort', photo: 'no photo available', description: 'Mugwort is a common name for several species of aromatic flowering plants. Originally from Europe. It is a weed that is widespread across North America'},
    
    {common_name: 'Ornamental Jewelweed', photo: 'no photo available', description: 'Originally native to the Himalayas, it has spread across most of North America.'},

    {common_name: 'Japanese Maple', photo: 'no photo available', description: 'Originally native to Japan, it was brought to North America and is widely used in parks and on properties.'},

])

posts = Post.create([
    {description: 'Found these in the forest in my local state park.  ~50 feet tall, wet soil, year-round', location_latitude: '41.0819° N', location_longitude: '-073.5829° E', photo: 'no photo available', invasive_species_id: 1, user_id: 3}, 

    {description: 'Growing all throughout the park and the road leading up to the park.  Wet, dry, sun, shade.', location_latitude: '33.7179° N', location_longitude: '-116.3431° E', photo: 'no photo available', invasive_species_id: 2, user_id: 3}, 

    {description: 'Found throughout my property and neighborhood', location_latitude: '41.1954° N', location_longitude: '-073.4379° E', photo: 'no photo available', invasive_species_id: 2, user_id: 1},

    {description: 'My neighbor has 5 on their property! They are absolutely beautiful this time of year', location_latitude: '43.0819° N', location_longitude: '-073.5829° E', photo: 'no photo available', invasive_species_id: 4, user_id: 3}, 

])


environments = Environment.create([
    {name: "wet"}, 
    {name: "moderate"},
    {name: "dry"}, 
    {name: "full-sun"}, 
    {name: "partial-sun"}, 
    {name: "shade"}, 
    {name: "woodland"}, 
    {name: "open"}, 
    {name: "developed area"}
])

posts_environments = PostEnvironment.create([
    {post_id: 1, environment_id: 2},{post_id: 1, environment_id: 4},{post_id: 1, environment_id: 9},
    {post_id: 2, environment_id: 3},{post_id: 2, environment_id: 4},{post_id: 2, environment_id: 9},
    {post_id: 3, environment_id: 2},{post_id: 3, environment_id: 4},{post_id: 3, environment_id: 8}
])