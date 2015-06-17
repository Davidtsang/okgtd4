class StuffsTags < ActiveRecord::Base
  validates_uniqueness_of :tag_id, :scope => :stuff_id

  belongs_to :tag
  belongs_to :stuff

end