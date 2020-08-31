class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :orders

  validates :email, presence: true

  before_create :set_admin, unless: -> { User.exists? }

  def admin?
    admin
  end

  private

  def set_admin
    self.admin = true
  end
end
