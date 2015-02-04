class Chapter < ActiveRecord::Base
  belongs_to :novel
  belongs_to :user
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { minimum: 140 }
end
