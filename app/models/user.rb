
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stuffs
  has_many :folders
  has_many :tags

  after_create :add_default_folder

  private

  def add_default_folder
    self.folders.create(name: "Inbox", folder_type:FoldersHelper::FOLDER_TYPE_INBOX)
    self.folders.create(name: "Next actions", folder_type:FoldersHelper::FOLDER_TYPE_NEXT)
    self.folders.create(name: "Project", folder_type:FoldersHelper::FOLDER_TYPE_PROJCET)
    self.folders.create(name: "Waiting for", folder_type:FoldersHelper::FOLDER_TYPE_WAITING)
    self.folders.create(name: "Someday/Maybe", folder_type:FoldersHelper::FOLDER_TYPE_SOMEDAY)
    self.folders.create(name: "Trash", folder_type:FoldersHelper::FOLDER_TYPE_TRASH)
  end

end
