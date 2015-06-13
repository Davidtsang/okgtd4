class Stuff < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  has_and_belongs_to_many :tags , :join_table => 'tags_stuffs'

end
