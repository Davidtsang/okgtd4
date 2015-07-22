class PagesController < StuffsController
  before_action :set_page, only: [:show, :edit, :update]

  def new
    @page = Page.new
  end


  def show
    respond_with(@page)
  end

  def edit

  end

  def update
    @page.update(page_params)
    respond_with(@page)
  end

  def create
    folder = current_user.folders.find_by_folder_type(FoldersHelper::FOLDER_TYPE_INBOX)

    @page = folder.pages.new(page_params)
    @page.status = PagesHelper::PAGE_STATUS_NORMAL
    @page.user_id = current_user.id

    if @page.save
      respond_with(@page)
    else
      render 'new'
    end

  end


  private

  def set_page
    @page = current_user.pages.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:content, :deadline, :status, :user_id, :folder_id, :name, :type)
  end

end
