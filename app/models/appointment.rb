class Appointment < ApplicationRecord
  # -----------------------------
  # Associations
  # -----------------------------
  belongs_to :user
  belongs_to :dance
  has_many :subscriptions, dependent: :destroy

  # Attachment
  has_one_attached :pic

  # -----------------------------
  # Geocoding
  # -----------------------------
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # -----------------------------
  # Validations
  # -----------------------------
  validates :name, presence: true, length: { minimum: 3 }
  validates :address, presence: true
  validates :start_on, presence: true
  validates :user_id, presence: true
  validates :dance_id, presence: true

  # -----------------------------
  # Scopes
  # -----------------------------
  scope :upcoming, -> { where("start_on >= ?", Time.current).order(start_on: :asc) }
  scope :past, -> { where("start_on < ?", Time.current).order(start_on: :desc) }
  scope :by_dance, ->(dance_id) { where(dance_id: dance_id) }

  # -----------------------------
  # Instance Methods
  # -----------------------------

  # Retourne l'image de l'événement ou une image par défaut
  def pic_url
    if pic.attached?
      Rails.application.routes.url_helpers.rails_blob_url(pic, only_path: true)
    else
      ActionController::Base.helpers.asset_path("default_appointment.png")
    end
  end

  # Nombre de participants inscrits
  def participant_count
    subscriptions.count
  end
end
