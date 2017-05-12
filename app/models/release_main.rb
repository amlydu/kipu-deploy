class ReleaseMain < ApplicationRecord
  has_many :releases

  after_create_commit { broadcast_data }

  def broadcast_data
    puts "RELEASE MAIN CREATED"
    ActionCable.server.broadcast "release_main_#{self.id}_channel", data: render_data(self)
    ActionCable.server.broadcast "release_main__channel", data: render_data(self)
  end

  private

  def render_data(rmain)
    ApplicationController.renderer.render(partial: 'release_mains/release_main', locals: { release_main: rmain })
  end
end
