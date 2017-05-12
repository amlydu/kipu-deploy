module ApplicationHelper
  def instance_box_color_class(status = nil)
    # color classes = panel-heading (blue), panel-green, panel-red, panel-yellow
    status = status.downcase unless status.nil?

    case status
    when nil
      'panel-yellow'
    when 'error'
      'panel-red'
    when 'success', 'completed'
      'panel-green'
    else
      'panel-heading' #blue
    end
  end

  def progress_bar_color_class(progress_status = nil)
    # progress classes: progress-bar-success (green), -info is blue, -warning (orange), -danger (red)
    progress_status = progress_status.downcase unless progress_status.nil?

    case progress_status
    when 'migrate_app', 'command'
      'progress-bar-info' #blue
    when nil, 'maintenance', 'restart'
      'progress-bar-warning' #orange
    when 'push_from_tar', 'push_from_slug'
      'progress-bar-success' #green
    else
      'progress-bar-danger' #red
    end
  end
end
