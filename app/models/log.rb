class Log < ApplicationRecord
  belongs_to :release

  after_create_commit { broadcast_data }

  def broadcast_data
    instance = self.release.instance
    ActionCable.server.broadcast "instance_#{instance.id}_channel", data: render_data(self)
    ActionCable.server.broadcast "instance__channel", data: {instance_id: instance.id, div: render_data }
  end

  private

  def render_data
    ApplicationController.renderer.render(partial: 'instances/instance', locals: { instance: self.release.instance })
  end
end
