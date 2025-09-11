class Dance < ApplicationRecord
  # -----------------------------
  # Associations
  # -----------------------------
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  has_many :profiles, dependent: :destroy

  # Attachment
  has_one_attached :photo

  # -----------------------------
  # Validations
  # -----------------------------
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }

  # -----------------------------
  # Scopes
  # -----------------------------
  scope :alphabetical, -> { order(title: :asc) }
  scope :with_photo, -> { joins(:photo_attachment) }

  # -----------------------------
  # Instance Methods
  # -----------------------------

  # Retourne l'image de la danse ou une image par défaut
  def photo_url
    if photo.attached?
      Rails.application.routes.url_helpers.rails_blob_url(photo, only_path: true)
    else
      ActionController::Base.helpers.asset_path("default_dance.png")
    end
  end

  # Nombre de participants pour cette danse
  def participant_count
    users.distinct.count
  end
end
