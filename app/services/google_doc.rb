require 'rest-client'

class GoogleDoc
  class << self
    def bike_request(params)
      url = 'https://docs.google.com/forms/d/1G6FUCGOiCRkLD_yZi7QNnb7bJsh-z5ieiIaOwvtdo_c/formResponse'
      data = {
        'entry.220054502': params[:first_name],
        'entry.290431168': params[:last_name],
        'entry.1171122435': params[:email],
        'entry.75608928': params[:arrival_date],
        'entry.749705894': params[:employer],
        'entry.50706888': params[:address],
        'entry.179220732': params[:country]
      }
      RestClient.post url, data, :content_type => :xml
    end

    def repair_request(params)
      url = 'https://docs.google.com/forms/d/1vGp2A8japRvmeuL38KNK3GW4EMV-yw2QWz964_NfK6Y/formResponse'
      data = {
        'entry.240890194': params[:name],
        'entry.1439591358': params[:email],
        'entry.607712080': params[:phone],
        'entry.998760472': params[:bike_location],
        'entry.1118058722': params[:bike_number],
        'entry.1576496174': params[:lock_combo],
        'entry.1246471219': params[:problem]
      }
      RestClient.post url, data, :content_type => :xml
    end
  end
end
