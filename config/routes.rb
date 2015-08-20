Rails.application.routes.draw do
  root 'visitors#index'

  devise_for :users

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  # TODO: as resource?
  get 'reports/subjects', as: :report_subjects
  # get 'visitors/index'
end
