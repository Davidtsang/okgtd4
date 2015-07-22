class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :show_projcet, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    #@folders = Folder.all
    @folders =current_user.folders.all
    respond_with(@folders)
  end



  def show
    if @folder.folder_type== FoldersHelper::FOLDER_TYPE_PROJCET

       render 'show_project'
    else
      respond_with(@folder)
    end

  end

  def new
    @folder = Folder.new
    respond_with(@folder)
  end

  def edit
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.save
    respond_with(@folder)
  end

  def update
    @folder.update(folder_params)
    respond_with(@folder)
  end

  def destroy
    @folder.destroy
    respond_with(@folder)
  end

  private
    def set_folder
      @folder =current_user.folders.find(params[:id])
      #@folder = Folder.find(params[:id])
    end

    def folder_params
      params.require(:folder).permit(:name)
    end
end
