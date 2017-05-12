class Instance < ApplicationRecord
  has_many :releases

  after_create_commit { broadcast_data }

  def broadcast_data
    ActionCable.server.broadcast "instance_#{self.id}_channel", data: render_data(self)
    ActionCable.server.broadcast "instance__channel", data: render_data(self)
  end

  private

  def render_data(rmain)
    ApplicationController.renderer.render(partial: 'instances/intances', locals: { instance: rmain })
  end
end
