require "rails_helper"

RSpec.describe "the applications show" do

  # 1. Application Show Page

  # As a visitor
  # When I visit an applications show page
  # Then I can see the following:
  # - Name of the Applicant
  # - Full Address of the Applicant including street address, city, state, and zip code
  # - Description of why the applicant says they'd be a good home for this pet(s)
  # - names of all pets that this application is for (all names of pets should be links to their show page)
  # - The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"

  before :each do
    @shelter1 = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @shelter2 = Shelter.create!(name: "Fuzzy Paws", city: "Boulder CO", foster_program: false, rank: 4)
    @shelter3 = Shelter.create!(name: "Good Boys", city: "New York NY", foster_program: true, rank: 2)
    @shelter4 = Shelter.create!(name: "Roshar Creatures", city: "Whimsical", foster_program: false, rank: 1)

    @pet1 = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter1.id)
    @pet2 = Pet.create!(name: "Dozer", age: 6, breed: "Pitbull", adoptable: true, shelter_id: @shelter2.id)
    @pet3 = Pet.create!(name: "Gunther", age: 10, breed: "Rottweiler", adoptable: true, shelter_id: @shelter3.id)
    @pet4 = Pet.create!(name: "Carl", age: 7, breed: "Goat", adoptable: false, shelter_id: @shelter4.id)

    @application1 = Application.create!(name: "Joe Baeza", street_address: "12345 Joe Street", city: "Irvine", state: "CA", zip_code: "54321",
                                        description: "I like Scooby and Carl so I want to adopt them", status: "In Progress")
    @application2 = Application.create!(name: "Billy Bob", street_address: "56789 The Bob Street", city: "Boulder", state: "CO", zip_code: "09876",
                                        description: "Dozer looks badass and I am a guy who wants a badass dog.", status: "In Progress")

    @pet_application1 = PetApplication.create!(application: @application1, pet: @pet1)
    @pet_application2 = PetApplication.create!(application: @application2, pet: @pet2)
  end

  describe "As a visitor do" do
    describe "when I visit an applications show page" do 
      it "will display the applications attributes" do
        visit "/applications/#{@application2.id}"

        expect(page).to have_content("Applicant: #{@application2.name}")
        expect(page).to have_content("Address: #{@application2.street_address}, #{@application2.city}, #{@application2.state}, #{@application2.zip_code}")
        expect(page).to have_content("Description: #{@application2.description}")
        within ("#pets-on-application") do
          expect(page).to have_content("Dozer")
        end # why does the string interpolation not work and return Pets: Pet
        expect(page).to have_content("Status: #{@application2.status}")
      end

      describe "and it has not been submitted" do
        it "will have a section on the page to add a pet to an application through a search bar" do
          visit "/applications/#{@application1.id}"

          expect(page).to have_content("Add a Pet to this Application")

          fill_in "name", with: "Dozer"

          click_button "Search for Pet"

          expect(page).to have_content("Dozer")
        end
        
        it "will have a button next to each pet name to adopt that pet" do
          visit "/applications/#{@application1.id}"
  
          expect(page).to have_content("Add a Pet to this Application")
  
          fill_in "name", with: "Dozer"
  
          click_button "Search for Pet"
  
          expect(page).to have_content("Dozer")

          within ("#pet-#{@pet2.id}") do
            click_button "Adopt this Pet"
          end

          within ("#pets-on-application") do
            expect(page).to have_content("Dozer")
          end
        end

        it "once I have added on or more pets I can submit the application and describe why I would be a good owner " do
          visit "/applications/#{@application1.id}"

          fill_in "name", with: "Dozer"
  
          click_button "Search for Pet"
  
          expect(page).to have_content("Dozer")

          within ("#pet-#{@pet2.id}") do
            click_button "Adopt this Pet"
          end

          within ("#pets-on-application") do
            expect(page).to have_content("Dozer")
          end
          
          within ("#submit-application") do
            expect(page).to have_content("Why I would make a good owner:")
            fill_in 'description', with: 'I want a pet man.'
            click_button "Submit Application"
          end
        end
      end
    end
  end
end
