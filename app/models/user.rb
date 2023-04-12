class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  enum role: %i[user admin]
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
  validates :username, presence: true

  validates :username, length: { minimum: 3, maximum: 70 }
  has_many :reservations, dependent: :destroy

  def admin?
    role == 'admin'
  end
end
