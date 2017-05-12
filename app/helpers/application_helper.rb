module ApplicationHelper
  def instance_box_color_class(status = nil)
    # color classes = panel-heading (blue), panel-green, panel-red, panel-yellow
    status = status.downcase unless status.nil?

    case status
    when 'progress'
      'panel-primary'
    when 'error'
      'panel-red'
    when 'success', 'completed'
      'panel-green'
    else
      'panel-yellow' #blue
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

  def progress_pct(release)
    total_steps = release.total_steps || 1
    current_steps = release.logs.last.step_number || 1
    current_steps * 100 / total_steps
  end
end
