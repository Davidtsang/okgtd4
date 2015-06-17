class Stuff < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  belongs_to :folder, :counter_cache => true



  has_and_belongs_to_many :tags

end
