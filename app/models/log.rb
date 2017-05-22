class Log < ApplicationRecord
  belongs_to :release

  after_create_commit { broadcast_data }

  def broadcast_data
    release = self.release
    instance = release.instance
    ActionCable.server.broadcast "instance__channel",
                                 data: {
                                   instance_id: instance.id,
                                   div: render_data(instance) }
    ActionCable.server.broadcast "release_#{self.release.id}_channel",
                                  data: {
                                    release_id: release.id,
                                    div: render_log_data(self)
                                  }
  end

  private

  def render_data(inst)
    ApplicationController.renderer.render(
      partial: 'instances/instance_box', locals: { instance: inst }
    )
  end

  def render_log_data(log)
    ApplicationController.renderer.render(
      partial: 'releases/release_row', locals: { log: log }
    )
  end
end
