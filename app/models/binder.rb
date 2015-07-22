class Binder < Stuff
  belongs_to :folder
  belongs_to :user

  has_many :pages, foreign_key: 'parent_id'
end