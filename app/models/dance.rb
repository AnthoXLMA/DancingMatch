class Dance < ApplicationRecord
# belongs_to :user
# belongs_to :partner
has_many :partners
has_many :users
has_many :appointments

validates :title, presence: true, uniqueness: true
end
