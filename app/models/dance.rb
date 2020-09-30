class Dance < ApplicationRecord
  STYLES = ["rock", "kizomba", "salsa", "oriental", "modern jazz", "west coast swing", "merengue",\
                  "bachata", "rock", "irish tap", "country", "zumba", "african"]

# belongs_to :user
# belongs_to :partner
has_many :partners
has_many :users
has_many :appointments

validates :title, presence: true, uniqueness: true
end
