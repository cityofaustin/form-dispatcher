Rails.application.routes.draw do
  match '/process', to: 'submissions#create', via: [:post]
end
