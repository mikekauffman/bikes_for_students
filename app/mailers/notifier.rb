class Notifier < ApplicationMailer

  def bike_request(hashed_params)
    @user_details = hashed_params
    mail(to: "mike.a.kauffman@gmail.com", subject: "New Bike Request")
  end

  def newsletter(hashed_params)
    @user_details = hashed_params
    mail(to: "mike.a.kauffman@gmail.com", subject: "Newsletter Signup")
  end

  def repair_request(hashed_params)
    @user_details = hashed_params
    mail(to: "mike.a.kauffman@gmail.com", subject: "New Repair Request")
  end
end
