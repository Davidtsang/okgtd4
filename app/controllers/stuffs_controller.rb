class StuffsController < ApplicationController
  before_action :set_stuff, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @stuffs = Stuff.all
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
    @stuff = Stuff.new(stuff_params)
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
      params.require(:stuff).permit(:content, :deadline, :status, :user_id)
    end
end
