# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Course.destroy_all
Inscription.destroy_all

### Courses - START ###
courses = []
courses << Course.create!({ name:"Full Stack", category: "Desafiolatam" })
courses << Course.create!({ name:"Front End", category: "Desafiolatam"  })
courses << Course.create!({ name:"Back End", category: "Desafiolatam" })
### Courses - END ###

### Users - START ###
users = []
users << User.create!({
          firstname: "Admin",
          lastname: "Admin",
          username: "Admin",
          email: "admin@admin.com",
          password: "12345678",
          password_confirmation: "12345678",
          admin: true
})
users << User.create!({
          firstname: "Gonzalo",
          lastname: "Desafio LATAM",
          username: "GonzDefLatam",
          email: "gonzalo@desafiolatam.com",
          password: "12345678",
          password_confirmation: "12345678"
})
users << User.create!({
          firstname: "Emilio",
          lastname: "Navarro",
          username: "sainfuw",
          email: "sainfuw@aol.com",
          password: "12345678",
          password_confirmation: "12345678"
})
users << User.create!({
          firstname: "Jose Tomas",
          lastname: "Codecido",
          username: "Toto",
          email: "josetomascodecido@gmail.com",
          password: "12345678",
          password_confirmation: "12345678"
})

users << User.create!({
          firstname: "Erwin",
          lastname: "Aguero",
          username: "enaguero",
          email: "erwin@desafiolatam.com",
          password: "12345678",
          password_confirmation: "12345678"
})
users << User.create!({
          firstname: "Rosa",
          lastname: "Figueroa",
          username: "rosa",
          email: "rosa@desafiolatam.com",
          password: "12345678",
          password_confirmation: "12345678"
})
users << User.create!({
          firstname: "Gabriel",
          lastname: "Alarcón",
          username: "galarcon",
          email: "galarconesp@desafiolatam.com",
          password: "12345678",
          password_confirmation: "12345678"
})
### Users - END ###

### Inscriptions - START ###
inscriptions = []

### Inscription to first course ###
inscriptions << Inscription.create!({
                kind: Inscription.kinds["teacher"],
                user_id: users[1].id,
                course_id: courses[0].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[2].id,
                course_id: courses[0].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["assistant"],
                user_id: users[3].id,
                course_id: courses[0].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[4].id,
                course_id: courses[0].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[5].id,
                course_id: courses[0].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[6].id,
                course_id: courses[0].id
})

### Inscription to second course ###
inscriptions << Inscription.create!({
                kind: Inscription.kinds["assistant"],
                user_id: users[1].id,
                course_id: courses[1].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["teacher"],
                user_id: users[2].id,
                course_id: courses[1].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[3].id,
                course_id: courses[1].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[4].id,
                course_id: courses[1].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[5].id,
                course_id: courses[1].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[6].id,
                course_id: courses[1].id
})

### Inscription to third course ###
inscriptions << Inscription.create!({
                kind: Inscription.kinds["assistant"],
                user_id: users[1].id,
                course_id: courses[2].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[2].id,
                course_id: courses[2].id
})
inscriptions << Inscription.create!({
                kind: Inscription.kinds["teacher"],
                user_id: users[3].id,
                course_id: courses[2].id
})

inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[4].id,
                course_id: courses[2].id
})

inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[5].id,
                course_id: courses[2].id
})

inscriptions << Inscription.create!({
                kind: Inscription.kinds["student"],
                user_id: users[6].id,
                course_id: courses[2].id
})
### Inscriptions - END ###
