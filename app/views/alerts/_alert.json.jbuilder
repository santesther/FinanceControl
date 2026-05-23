json.extract! alert, :id, :user_id, :expense_id, :alert_type, :message, :channel, :status, :sent_at, :created_at, :updated_at
json.url alert_url(alert, format: :json)
