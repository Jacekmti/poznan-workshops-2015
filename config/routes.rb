Rails.application.routes.draw do
  root 'students#index'

  devise_for :users

  resources :students do
    get :subjects
  end

  resources :teachers

  # TODO: as resource?
  get 'reports/subjects', to: 'reports#subjects', as: :report_subjects
end
