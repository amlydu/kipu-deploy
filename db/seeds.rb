# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  ReleaseMain.create(uuid: Faker::Number.number(25), start_time: Faker::Number.number(8), end_time: Faker::Number.number(8))
end

10.times do
  i = Instance.create(name: Faker::App.name )

  10.times do
    rmain_id = ReleaseMain.all.pluck(:id).sample
    r = i.releases.create(uuid: Faker::Number.number(25), start_time: Faker::Number.number(8), end_time: Faker::Number.number(8), release_main_id: rmain_id)

    5.times do
      lambda_names = ['push_tar', 'push_slug', 'migrate', 'command', 'restart', 'maintenance']
      current_lambda = lambda_names.sample
      r.logs.create(lambda_name: current_lambda, log: Faker::Lorem.paragraph, time: Faker::Number.number(8))
    end
  end
end
