class LambdasController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def create
    inst = Instance.find_by(name: params['app_name'])
    if inst.present?
      inst.update(deploy_status: params['current_status'], progress_status: params['lambda_type'])
    else
      Instance.create(name: params['app_name'], deploy_status: params['current_status'], progress_status: params['lambda_type'])
    end

    rmain = ReleaseMain.find_or_create_by(uuid: params['master_release_uuid'])

    rel = rmain.releases.create_with(total_steps: 'step_count').find_or_create_by(uuid: params['app_release_uuid'], instance_id: inst.id)

    rel.logs.create(lambda_name: params['lambda_type'], log: params['log'], time: params['time'], step_number: params['current_step'])
  end
end
