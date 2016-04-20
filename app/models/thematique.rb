class Thematique < ActiveRecord::Base
  has_many :projets
  validates_presence_of :categorie
end