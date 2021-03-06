class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :novels, dependent: :destroy
  has_many :chapters
  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }
  acts_as_voter
end
