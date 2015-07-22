class Page < Stuff
  validates_presence_of :content
  belongs_to :folder
  belongs_to :user

  belongs_to :binder

end