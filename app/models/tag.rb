class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :stuffs ,    :join_table => 'tags_stuffs'


end
