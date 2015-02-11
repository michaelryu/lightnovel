class Chapter < ActiveRecord::Base
  belongs_to :novel, touch: true
  belongs_to :user
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { minimum: 140 }
  default_scope { order( created_at: :desc)}

  def previous
	  self.class.where(["id < ?", id]).first
	end

	def next
	  self.class.where(["id > ?", id]).last
	end

  
end
