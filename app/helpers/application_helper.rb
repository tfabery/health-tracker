module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def sortable(column, title = nil, type, user)
    eval 'title ||= column.titleize
    direction = column == params[:' + type + '_sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to title, user_path(user, :' + type + '_sort => column, :direction => direction)'
  end
  #
  # def exercise_sortable(column, title = nil, user)
  #   title ||= column.titleize
  #   direction = column == params[:exercise_sort] && params[:direction] == "asc" ? "desc" : "asc"
  #   link_to title, user_path(user, :exercise_sort => column, :direction => direction)
  # end
  #
  # def food_sortable(column, title = nil)
  #   title ||= column.titleize
  #   direction = column == params[:food_sort] && params[:direction] == "asc" ? "desc" : "asc"
  #   link_to title, :food_sort => column, :direction => direction
  # end
end
