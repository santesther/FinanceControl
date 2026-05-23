class Alert < ApplicationRecord
  after_initialize { self.status ||= "pending" }

  belongs_to :user
  belongs_to :expense

  validates :message, presence: true
  validates :alert_type, presence: true
  validates :channel, inclusion: { in: %w[app whatsapp telegram], allow_blank: true }

  validates :status, presence: true, inclusion: { in: %w[pending sent failed] }
end
