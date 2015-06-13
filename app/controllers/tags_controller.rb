class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @tags = current_user.tags.all
    respond_with(@tags)
  end

  def show
    respond_with(@tag)
  end

  def new
    @tag = current_user.tags.new
    respond_with(@tag)
  end

  def edit
  end

  def create
    @tag = current_user.tags.new(tag_params)
    @tag.status = TagsHelper::TAG_STATUS_NORMAL

    @tag.save
    respond_with(@tag)
  end

  def update
    @tag.update(tag_params)
    respond_with(@tag)
  end

  def destroy
    @tag.destroy
    respond_with(@tag)
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name, :user_id, :status, :the_type)
    end
end
