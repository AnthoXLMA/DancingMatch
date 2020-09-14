class User < ApplicationRecord
  has_many :dances
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
