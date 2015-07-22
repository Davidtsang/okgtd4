class StaticPageController < ApplicationController
  def home

    if user_signed_in?
      @page = Page.new
      @stuffs = current_user.stuffs.last(7)
      @next_actions = current_user.pages.where(:folder_id => FoldersHelper::FOLDER_TYPE_NEXT)
      @today_schedules = current_user.pages.where(:deadline, Date.today.beginning_of_day..Date.today.end_of_day).all
      @tomorrow_schedules = current_user.pages.where(:deadline, DateTime.tomorrow.beginning_of_day..DateTime.tomorrow.end_of_day).all
    end
  end
end
