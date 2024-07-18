# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
@shelter_2 = Shelter.create(name: "RGV animal shelter", city: "Harlingen, TX", foster_program: false, rank: 5)
@shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)

@pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: false)
@pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
@pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
@pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)

@application1 = Application.create!(name: "Joe Baeza", street_address: "12345 Joe Street", city: "Irvine", state: "CA", zip_code: "54321",
                                    description: "I like Clawdia so I want to adopt them.", status: "In Progress")
@application2 = Application.create!(name: "Billy Bob", street_address: "56789 The Bob Street", city: "Boulder", state: "CO", zip_code: "09876",
                                    description: "I'll go for Mr. Pirate since that name sounds sick.", status: "Pending")
@application3 = Application.create!(name: "The Guy", street_address: "111111 The Guy Avenue", city: "Seattle", state: "WA", zip_code: "29212",
                                    description: "Lucille Bald looks like a sphynx and I think I am a sphynx kind of guy.", status: "Pending")
@pet_application1 = PetApplication.create!(application: @application1, pet: @pet_2)
@pet_application2 = PetApplication.create!(application: @application2, pet: @pet_1)
@pet_application3 = PetApplication.create!(application: @application3, pet: @pet_3)
@pet_application4 = PetApplication.create!(application: @application1, pet: @pet_4)
@pet_application5 = PetApplication.create!(application: @application2, pet: @pet_2)