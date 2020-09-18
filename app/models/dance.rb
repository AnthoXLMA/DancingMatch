class Dance < ApplicationRecord
# belongs_to :partner
has_many :partners
has_many :appointments
end
