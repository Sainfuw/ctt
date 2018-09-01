# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Courses - START ####

courses = []
courses << Course.create!({name:"Full Stack"})
courses << Course.create!({name:"Front End"})
courses << Course.create!({name:"Back End"})

### Courses - END ####
users = []
users << User.create({
          firstname: "Gonzalo",
          lastname: "Desafio LATAM",
          username: "GonzDefLatam",
          email: "gonzalo@desafiolatam.com"
        })

users << User.create({
          firstname: "Emilio",
          lastname: "Navarro",
          username: "sainfuw",
          email: "sainfuw@aol.com"
        })

users << User.create({
          firstname: "Jose Tomas",
          lastname: "Codecido",
          username: "Toto",
          email: "josetomascodecido@gmail.com"
        })





