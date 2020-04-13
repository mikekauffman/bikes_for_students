class PagesController < ApplicationController
  require 'net/http'
  skip_before_filter :verify_authenticity_token

  WELCOME_LANGUAGES = ["Welcome", "Dobrodošli","Maeva", "Welkom", "Kushe", "Weizo", "Benvenuti", "Cao mung", "Witamy", "Mire se", "Vini", "Vitaite", "Sewa", "Merhaba", "Shagatom", "Kiriniz", "Foon Ying", "Keblar"]

  def home
    # @welcome_languages = WELCOME_LANGUAGES
    render :temp
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
    GoogleDoc.bike_request(params)
    # Notifier.bike_request(prune(params)).deliver_now
    render :bike_confirm
  end

  def repair_request
    GoogleDoc.repair_request(params)
    # Notifier.repair_request(prune(params)).deliver_now
    redirect_to :root
  end

  def orientation
    GoogleDoc.orientation_sign_up(prune(params))
    redirect_to :root
  end

  def take_home_student
    GoogleDoc.take_home_student(prune(params))
    redirect_to :root
  end

  def take_home_resident
    GoogleDoc.take_home_resident(prune(params))
    redirect_to :root
  end

  def shorebirds
    GoogleDoc.shorebirds(prune(params))
    redirect_to :root
  end

  def admin
    if logged_in?
      @emails = Newsletter.pluck(:email).uniq.reject(&:empty?)
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
