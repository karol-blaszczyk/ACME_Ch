namespace :payments do
  desc "charge users"
  task charge: [:environment] do
    User.where(billing_day: Date.today.day).each do |user|
      UserChargeJob.perform_later(user)
    end
  end
end
