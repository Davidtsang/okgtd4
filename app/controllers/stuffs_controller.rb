
class StuffsController < ApplicationController
  before_action :set_stuff, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def add_tag
    @stuff = current_user.stuffs.find(params[:id])
    @tags = current_user.tags.all
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

    folder = current_user.folders.find_by_folder_type( FoldersHelper::FOLDER_TYPE_INBOX)

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

  private
    def set_stuff
      @stuff = Stuff.find(params[:id])
    end

    def stuff_params
      params.require(:stuff).permit(:content, :deadline, :status,:user_id,:folder_id)
    end
end
