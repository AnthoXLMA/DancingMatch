class Dance < ApplicationRecord
has_many :partners, dependent: :destroy

has_many :appointments
end
