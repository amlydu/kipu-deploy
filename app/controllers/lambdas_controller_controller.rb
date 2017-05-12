class LambdasControllerController < ApplicationController

  def create
    inst = Instance.find_or_create_by(name: params['app_name'])
    rmain = ReleaseMain.find_or_create_by(uuid: params['master_release_uuid'])

    rel = rmain.releases.find_or_create_by(uuid: params['app_release_uuid'], instance_id: inst.id)

    rel.logs.create(lambda_name: params['lambda_type'], log: params['log'], time: params['time'])
  end
end
