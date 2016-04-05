class Compte < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_default :statut_id, 3
  belongs_to :statut
    
  def get_statut
    return self.statut.label
  end
    
end
