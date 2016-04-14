class Jobsearch < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :company, presence: true, length: { maximum: 50 }
  validates :role, presence: true, length: { maximum: 50 }
  validates :description, presence: true
end
