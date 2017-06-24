class HomeController < ApplicationController
  def index
  end

  def subscribe
    user = User.find_by(email: params[:email])
    if user.present?
      @subscribed = false
    else
      pswd = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
      user = User.create(email:params[:email], password: pswd, password_confirmation: pswd)
      gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
      gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(body: {email_address: params[:email], status: "subscribed"})
      @subscribed = true
    end
    respond_to do |format|
      format.js
    end
  end
end
