Rails.application.routes.draw do
  root 'pages#home'
  post 'newsletter' => 'pages#newsletter'
  post 'bike_request' => 'pages#bike_request'
  post 'repair_request' => 'pages#repair_request'
  post 'orientation' => 'pages#orientation'
  post 'shorebirds' => 'pages#shorebirds'
  post 'take_home_student' => 'pages#take_home_student'
  post 'take_home_resident' => 'pages#take_home_resident'
  post 'login' => 'pages#auth'

  get 'admin' => 'pages#admin'
  get 'login' => 'pages#login'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
end
