class PagesController < ApplicationController

  WELCOME_LANGUAGES = ["Welcome", "Maeva", "Welkom", "Kushe", "Weizo", "Benvenuti", "Cao mung", "Witamy", "Mire se", "Vini", "Vitaite", "Sewa", "Merhaba", "Shagatom", "Kiriniz", "Foon Ying", "Keblar"]

  def home
    @welcome_languages = WELCOME_LANGUAGES
  end

end
