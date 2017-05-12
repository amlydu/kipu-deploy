module ApplicationHelper
  def instance_box_color_class(status = nil)
    # color classes = panel-heading (blue), panel-green, panel-red, panel-yellow
    case status
    when nil
      'panel-yellow'
    when 'error'
      'panel-red'
    when 'success'
      'panel-green'
    else
      'panel-heading' #blue
    end
  end

  def progress_bar_color_class(progress_status = nil)
    # progress classes: progress-bar-success (green), -info is blue, -warning (orange), -danger (red)
    case progress_status
    when nil
      'progress-bar-warning'
    when 'error'
      'progress-bar-danger' #orange
    when 'success'
      'progress-bar-success' #green
    else
      'progress-bar-info' #blue
    end
  end
end
