class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :stuffs
  has_many :pages
  has_many :binders

end
