class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  validates :pet_id, application_id:, presence: true
end