class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable 
  
  has_many :posts

  validates :firstname, presence: true, :uniqueness => {:case_sensitive => false }
  validates :lastname, presence: true, :uniqueness => {:case_sensitive => false }
  validates :email, presence: true, :uniqueness => {:case_sensitive => false }
  validates :password, presence: true, :uniqueness => {:case_sensitive => false }


end
