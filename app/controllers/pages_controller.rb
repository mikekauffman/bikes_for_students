class PagesController < ApplicationController
  require 'net/http'
  skip_before_filter :verify_authenticity_token

  WELCOME_LANGUAGES = ["Welcome", "Maeva", "Welkom", "Kushe", "Weizo", "Benvenuti", "Cao mung", "Witamy", "Mire se", "Vini", "Vitaite", "Sewa", "Merhaba", "Shagatom", "Kiriniz", "Foon Ying", "Keblar"]

  def home
    @welcome_languages = WELCOME_LANGUAGES
  end

  def newsletter
    Notifier.newsletter(prune(params)).deliver_now
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

  private

  def prune(params)
    hashed_params = params.to_hash
    hashed_params.delete("controller")
    hashed_params.delete("action")
    hashed_params
  end

end
