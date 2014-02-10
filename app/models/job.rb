class Job < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :employer, presence: true, length: { maximum: 140 }
	validates :role, presence: true, length: { maximum: 140 }
	validates :description, presence: true
	validates :criteria, presence: true
	validates :salary_type, presence: true
	validates :closed_date, presence: true
	validates :category, presence: true
	validates :contact, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :contact_email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :location, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

end
