require "rails_helper"

RSpec.describe PetApplication, type: :model do
  describe "relationships" do
    it { should belongs_to(:pet)}
    it { should belongs_to(:application)}
  end
end