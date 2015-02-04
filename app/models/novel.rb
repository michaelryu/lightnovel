class Novel < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
  validates :user_id, presence: true
  validates :title, presence: true, length: { in: 3..100 }, uniqueness: true
  validates :summary, presence: true, length: { minimum: 140 }
  validates :author, presence: true, length: { in: 2..50 }
end
