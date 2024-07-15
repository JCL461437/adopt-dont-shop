# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@shelter1 = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
@shelter2 = Shelter.create!(name: "Fuzzy Paws", city: "Boulder CO", foster_program: false, rank: 4)
@shelter3 = Shelter.create!(name: "Good Boys", city: "New York NY", foster_program: true, rank: 2)
@shelter4 = Shelter.create!(name: "Roshar Creatures", city: "Whimsical", foster_program: false, rank: 1)

@pet1 = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter1.id)
@pet2 = Pet.create!(name: "Dozer", age: 6, breed: "Pitbull", adoptable: true, shelter_id: @shelter2.id)
@pet3 = Pet.create!(name: "Gunther", age: 10, breed: "Rottweiler", adoptable: true, shelter_id: @shelter3.id)
@pet4 = Pet.create!(name: "Carl", age: 7, breed: "Goat", adoptable: false, shelter_id: @shelter4.id)

@application1 = Application.create!(name: "Joe Baeza", street_address: "12345 Joe Street", city: "Irvine", state: "CA", zip_code: "54321",
                                    description: "I like Scooby and Carl so I want to adopt them", status: "Pending")
@application2 = Application.create!(name: "Billy Bob", street_address: "56789 The Bob Street", city: "Boulder", state: "CO", zip_code: "09876",
                                    description: "Dozer looks badass and I am a guy who wants a badass dog.", status: "Pending")

@pet_application1 = PetApplication.create!(application: @application1, pet: @pet1)