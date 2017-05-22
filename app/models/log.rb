class Log < ApplicationRecord
  belongs_to :release

  after_create_commit { broadcast_data }

  def broadcast_data
    instance = self.release.instance
    ActionCable.server.broadcast "instance_#{instance.id}_channel",
                                 data: render_data(instance)
    ActionCable.server.broadcast "instance__channel",
                                 data: {
                                   instance_id: instance.id,
                                   div: render_data(instance) }
  end

  private

  def render_data(inst)
    ApplicationController.renderer.render(
      partial: 'instances/instance_box', locals: { instance: inst }
    )
  end
end
