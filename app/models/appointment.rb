class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :partner
  enum status: [:published, :unpublished, :not_set]
  enum localization: [:home, :foreign, :none]
end
