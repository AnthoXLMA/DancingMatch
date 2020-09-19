class Dance < ApplicationRecord
# belongs_to :partner
has_many :partners, dependent: :destroy
has_many :appointments
end
