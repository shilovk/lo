class Food < ApplicationRecord
  validates :title, presence: true
  scope :on_date, ->(date) { where('date = ?', date) }

  def self.weak_days
    %w[Monday Tuesday Wednesday	Thursday Friday Saturday Sunday]
  end

  def self.weak_dates(date = Time.current.to_date)
    (date.beginning_of_week..date.end_of_week).to_a
  end
end
