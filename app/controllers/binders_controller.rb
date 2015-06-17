class BindersController < ApplicationController
  before_action :set_binder, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @binders = Binder.all
    respond_with(@binders)
  end

  def show
    respond_with(@binder)
  end

  def new
    @binder = Binder.new
    respond_with(@binder)
  end

  def edit
  end

  def create
    @binder = Binder.new(binder_params)
    @binder.save
    respond_with(@binder)
  end

  def update
    @binder.update(binder_params)
    respond_with(@binder)
  end

  def destroy
    @binder.destroy
    respond_with(@binder)
  end

  private
    def set_binder
      @binder = Binder.find(params[:id])
    end

    def binder_params
      params.require(:binder).permit(:name, :user_id, :status, :stuffs_count, :the_type)
    end
end
