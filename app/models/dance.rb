class Dance < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  # has_many :profiles
  # belongs_to :users
  validates :title, presence: true, uniqueness: true
  has_one_attached :photo
  # def partners
  #   @users = User.all
  #   @dances = Dance.all
  #   @dance = @dances.each do |dance|
  #     puts dance
  #   end
  #   @community = @user.dance.count
  # end
end
