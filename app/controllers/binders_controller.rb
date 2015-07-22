class BindersController < StuffsController
  before_action :set_binder ,only: [:show]

  def new

    @binder = Binder.new

    @binder.folder_id = params[:folder_id]

    respond_with(@binder)

  end

  def show

  end

  def create
    folder = current_user.folders.find(params[:binder][:folder_id])

    @binder = folder.binders.new(binder_params)
    @binder.status =BindersHelper::BINDER_STATUS_NORMAL
    @binder.user_id = current_user.id
    @binder.save

    respond_with(@binder)
  end


  private

  def set_binder
    @binder =  current_user.stuffs.find(params[:id])
  end

  def binder_params
    params.require(:binder).permit(:deadline, :status, :user_id, :folder_id, :name, :type)
  end

end