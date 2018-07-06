class User < ApplicationRecord

  has_secure_password

  extend FriendlyId
  friendly_id :username

  has_many :sites, dependent: :destroy

  scope :by_last_name, -> { order(last_name: :asc) }

  validates :first_name, :last_name, :email, :username, presence: true
  validates :username, format: { without: /[@]/, message: "can't be an email address" }
  validates :email, format: { with: /\A[\w!#$%&'*+\/=?`{|}~^-]+(?:\.[\w!#$%&'*+\/=?`{|}~^-]+)*@(?:[A-Z0-9-]+\.)+[A-Z]{2,6}\z/i, message: "is not a valid address" }
  validates :email, :username, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

end
