class PagesController < ApplicationController
  require 'net/http'
  skip_before_filter :verify_authenticity_token

  WELCOME_LANGUAGES = ["Welcome", "Maeva", "Welkom", "Kushe", "Weizo", "Benvenuti", "Cao mung", "Witamy", "Mire se", "Vini", "Vitaite", "Sewa", "Merhaba", "Shagatom", "Kiriniz", "Foon Ying", "Keblar"]

  def home
    @welcome_languages = WELCOME_LANGUAGES
  end

  def newsletter
    newsletter = Newsletter.create(
      name: params[:name],
      email: params[:email]
    )
    Notifier.newsletter(newsletter).deliver_now
    redirect_to :root
  end

  def bike_request
    Notifier.bike_request(prune(params)).deliver_now
    redirect_to :root
  end

  def repair_request
    Notifier.repair_request(prune(params)).deliver_now
    redirect_to :root
  end

  def admin
    if logged_in?
      @emails = Newsletter.pluck(:email).uniq!
    else
      redirect_to login_path
    end
  end

  def login
  end

  def auth
    if params[:password] == ENV["admin_password"]
      session[:id] = true
      redirect_to admin_path
    else
      render :login
    end
  end

  private

  def prune(params)
    hashed_params = params.to_hash
    hashed_params.delete("controller")
    hashed_params.delete("action")
    hashed_params
  end

  def logged_in?
    session[:id] ? true : false
  end

end
