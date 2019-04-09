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
        'entry.179220732': params[:country],
        'entry.832785602': params[:sponsor],
        'entry.1289831634': params[:needs_bike],
        'entry.186173074': params[:received_bike],
        'entry.763580817': params[:gender],
        'entry.1273807544': params[:height]

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

    def orientation_sign_up(params)
      form_id = params['form']
      name = params['name']
      sponsor = params['sponsor']
      email = params['email']
      ride = params['ride']

      formConfig = {
        '1' => {
          url: 'https://docs.google.com/forms/d/1PDamJq8f_9n37kpSdJgUL9sKWejh8KTqiShpVnfw3p4/formResponse',
          name: 'entry.724033099',
          sponsor: 'entry.1517326090',
          email: 'entry.1161828436',
          ride: 'entry.359498300'
        },
        '2' => {
          url: 'https://docs.google.com/forms/d/1odbnD6TGKrvMWsdYEx5zvlBObocP4BDXyB3WO7tl-7c/formResponse',
          name: 'entry.28786248',
          sponsor: 'entry.465685260',
          email: 'entry.1756011234',
          ride: 'entry.1254030292'
        },
        '3' => {
          url: 'https://docs.google.com/forms/d/1MqTlurj4qRlpZqzne8f1Wu50_R25ifPtVDJYE3r2H-I/formResponse',
          name: 'entry.983224772',
          sponsor: 'entry.1921044449',
          email: 'entry.524985918',
          ride: 'entry.1986025925'
        }
      }

      form = formConfig[form_id]
      url = form[:url]

      data = {
        form[:name] => name,
        form[:sponsor] => sponsor,
        form[:email] => email,
        form[:ride] => ride
      }

      RestClient.post url, data, :content_type => :xml
    end

    def take_home_student(params)
      url = 'https://docs.google.com/forms/d/1wHJa6kWOz0h9WOKQf8dbEwR8Cha_LBAgsqDDCrlrkLg/formResponse'
      data = {
        'entry.1541884923': params['name'],
        'entry.38679319': params['country'],
        'entry.609453791': params['email'],
        'entry.1557739720': params['friend_1'],
        'entry.1195203998': params['friend_2'],
      }
      RestClient.post url, data, :content_type => :xml
    end

    def take_home_resident(params)
      url = 'https://docs.google.com/forms/d/1ucY_F_Rnf4egcYbOqukPqhorFysrMmvahg05-kXfeVs/formResponse'
      data = {
        'entry.1661805248': params['name'],
        'entry.1496136801': params['email'],
      }
      RestClient.post url, data, :content_type => :xml
    end

    def shorebirds(params)
      url = 'https://docs.google.com/forms/d/14IB-FnhZyULKX9JmMr35xv2qnODxDmUIkxbWt8rsypY/formResponse'
      data = {
        'entry.245847006': params['email'],
      }
      RestClient.post url, data, :content_type => :xml
    end
  end
end
