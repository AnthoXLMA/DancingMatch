class Dance < ApplicationRecord
belongs_to :user
has_many :partners
# has_many :users, dependent: :destroy
has_many :appointments
end
