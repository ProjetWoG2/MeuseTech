class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
<<<<<<< HEAD
  
  include TheRole::Api::User

  has_one :profile  
  has_many :surveys

=======
  has_one :profile
  belongs_to :role 
  attr_default :role_id, 3 
  has_many :surveys
>>>>>>> upstream/master
end
