module ApplicationHelper

  def stuff_class_by_status(status)
    result = ""

    if status == StuffsHelper::STUFF_STATUS_DONE
      result = "class=\"item-done\"".html_safe
    elsif status == StuffsHelper::STUFF_STATUS_DELETE
      result = "class=\"item-removed\"".html_safe
    end

    return result

  end

  def stuff_status_to_name status

    result = "正常"

    if status == StuffsHelper::STUFF_STATUS_DONE
      result = "已完成"
    elsif status == StuffsHelper::STUFF_STATUS_DELETE
      result = "已删除"
    end

    return result

  end

end
