
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stuffs
  has_many :folders
  has_many :tags
  has_many :binders

  after_create :add_default_folder

  private

  def add_default_folder
    self.folders.create(name: "收集箱", folder_type:FoldersHelper::FOLDER_TYPE_INBOX)
    self.folders.create(name: "下一步动作", folder_type:FoldersHelper::FOLDER_TYPE_NEXT)
    self.folders.create(name: "项目", folder_type:FoldersHelper::FOLDER_TYPE_PROJCET)
    self.folders.create(name: "等待中", folder_type:FoldersHelper::FOLDER_TYPE_WAITING)
    self.folders.create(name: "未来/或许", folder_type:FoldersHelper::FOLDER_TYPE_SOMEDAY)
    self.folders.create(name: "日程表", folder_type:FoldersHelper::FOLDER_TYPE_SCHEDULE)
    self.folders.create(name: "已完成", folder_type:FoldersHelper::FOLDER_TYPE_DONE)
    self.folders.create(name: "垃圾桶", folder_type:FoldersHelper::FOLDER_TYPE_TRASH)

    # add some tag
    self.tags.create(name:"@家里")
    self.tags.create(name:"@办公室")

  end

end
