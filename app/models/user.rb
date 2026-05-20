class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, dependent: :destroy
  has_many :alerts, dependent: :destroy
  has_many :monthly_goals, dependent: :destroy

  validates :phone_number, presence: true, if: :notification_enabled?

  def notification_enabled?
    notification_channel.present?
  end
end
