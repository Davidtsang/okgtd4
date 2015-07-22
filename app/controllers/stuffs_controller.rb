class StuffsController < ApplicationController
  before_action :set_stuff, only: [:show, :edit, :update, :destroy, :add_tags, :move, :move_act,:add_deadline_before_to_schedule, :add_deadline_before_to_schedule_act, :copy, :copy_act, :remove_tags, :remove_tags_act, :select_binder, :select_binder_act]

  before_action :authenticate_user!
  respond_to :html

  def add_tags

    is_exist_ids = @stuff.tags.ids.to_a
    if is_exist_ids.count > 0
      @tags = current_user.tags.where(["tags.id NOT IN (?)", is_exist_ids])
    else
      @tags = current_user.tags.find_all
    end

  end

  def move

    #move to other folder
    @folders = current_user.folders.find_all

  end

  def add_deadline_before_to_schedule

  end

  def add_deadline_before_to_schedule_act

    #update deadline
    @stuff.deadline = DateTime.new(params[:stuff]["deadline(1i)"].to_i,
                                   params[:stuff]["deadline(2i)"].to_i,
                                   params[:stuff]["deadline(3i)"].to_i,
                                   params[:stuff]["deadline(4i)"].to_i,
                                   params[:stuff]["deadline(5i)"].to_i)

    #get schedule folder
    schedule_folder = current_user.folders.where(:folder_type => FoldersHelper::FOLDER_TYPE_SCHEDULE).first

    @stuff.folder_id = schedule_folder.id

    @stuff.save!

    #find folder
    redirect_to @stuff

  end

  def new_binder
    @stuff = Binder.new

    respond_with(@stuff)
  end

  def create_binder
    binder = current_user.stuffs.new(stuff_params)
    project_folder = current_user.folders.where(:folder_type => FoldersHelper::FOLDER_TYPE_PROJCET).first
    binder.folder_id = project_folder.id

    binder.status = StuffsHelper::BINDER_STATUS_NORMAL

    binder.save

    redirect_to :action => 'select_binder', :id=> params[:id]

  end

  def select_binder

    project_folder = current_user.folders.where(:folder_type => FoldersHelper::FOLDER_TYPE_PROJCET).first
    @binders = current_user.binders.where(:folder_id=> project_folder.id )

  end

  def select_binder_act

    #put stuff parent id is binder id
    binder = current_user.binders.find(params[:target_binder])

    @stuff.parent_id= binder.id

    #put stuff folder_id = binder.folder_id
    @stuff.folder_id= binder.folder_id

    #save
    @stuff.save!

    #render stuff
    redirect_to @stuff

  end

  def move_act

    target_folder = params[:target_folder]
    @stuff.folder_id = target_folder

    folder = Folder.find(target_folder)
    if folder.folder_type == FoldersHelper::FOLDER_TYPE_SCHEDULE
      redirect_to :action => 'add_deadline_before_to_schedule', id: @stuff.id

    #remove to project create/select binder
    elsif folder.folder_type== FoldersHelper::FOLDER_TYPE_PROJCET and @stuff.parent_id == nil and @stuff.type != "Binder"

      redirect_to :action => 'select_binder', id: @stuff.id


    else
      if folder.folder_type == FoldersHelper::FOLDER_TYPE_DONE
        @stuff.status = StuffsHelper::STUFF_STATUS_DONE
      elsif folder.folder_type == FoldersHelper::FOLDER_TYPE_TRASH
        @stuff.status = StuffsHelper::STUFF_STATUS_DELETE

        #elsif to schedule folder ,let user add deadline time
      elsif folder.folder_type == FoldersHelper::FOLDER_TYPE_SCHEDULE
      end

      @stuff.save!
      redirect_to @stuff
    end

  end

  def copy

    @folders = current_user.folders.find_all
  end

  def copy_act

    new_stuff = current_user.stuffs.build
    new_stuff.content = stuff.content
    new_stuff.status = stuff.status
    new_stuff.folder_id = params[:target_folder]

    new_stuff.save

    redirect_to new_stuff

  end

  def remove_tags
    @stuff = current_user.stuffs.find(params[:id])
  end

  def remove_tags_act
    stuff_tags = params[:stuff_tags]
    id = params[:id]


    stuff_tags.each do |tid|

      tag =@stuff.tags.find(tid)

      if tag
        @stuff.tags.delete(tag)
      end

    end

    redirect_to action: "show", id: id

  end

  def create_stuff_tags
    stuff_tags = params[:stuff_tags]
    id = params[:id]

    stuff_tags.each do |tid|
      StuffsTags.create!(tag_id: tid, stuff_id: id)
    end

    redirect_to action: "show", id: id

  end

  def index
    @stuffs = current_user.stuffs.all
    respond_with(@stuffs)
  end

  def show
    respond_with(@stuff)
  end

  def new
    @stuff = Stuff.new

    respond_with(@stuff)
  end

  def edit
  end

  def create

    folder = current_user.folders.find_by_folder_type(FoldersHelper::FOLDER_TYPE_INBOX)

    @stuff = folder.stuffs.new(stuff_params)
    @stuff.status = StuffsHelper::STUFF_STATUS_NORMAL
    @stuff.user_id = current_user.id

    @stuff.save

    respond_with(@stuff)

  end

  def update

    @stuff.update(stuff_params)
    respond_with(@stuff)
  end

  def destroy
    @stuff.destroy
    respond_with(@stuff)
  end

  protected
  def set_stuff

    @stuff = current_user.stuffs.find(params[:id])
  end

  def stuff_params
    params.require(:stuff).permit(:content, :deadline, :status, :user_id, :folder_id, :name, :type)
  end
end
