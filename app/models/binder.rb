class Binder < ActiveRecord::Base
  belongs_to :folder

  has_many :stuffs

end
