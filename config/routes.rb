Rails.application.routes.draw do
  devise_for :foreigners, skip: :all
  devise_scope :foreigner do
    get 'foreigners/sign_in' => 'foreigners/sessions#new', as: 'new_foreigner_session'
    post 'foreigners/sign_in' => 'foreigners/sessions#create', as: 'foreigner_session'
    delete 'foreigners/sign_out' => 'foreigners/sessions#destroy', as: 'destroy_foreigner_session'
    get 'foreigners/sign_up' => 'foreigners/registrations#new', as: 'new_foreigner_registration'
    post 'foreigners' => 'foreigners/registrations#create', as: 'foreigner_registration'
    get 'foreigners/password/new' => 'foreigners/passwords#new', as: 'new_foreigner_password'
  end
  devise_for :tutors, skip: :all
  devise_scope :tutor do
    get 'tutors/sign_in' => 'tutors/sessions#new', as: 'new_tutor_session'
    post 'tutors/sign_in' => 'tutors/sessions#create', as: 'tutor_session'
    delete 'tutors/sign_out' => 'tutors/sessions#destroy', as: 'destroy_tutor_session'
    get 'tutors/sign_up' => 'tutors/registrations#new', as: 'new_tutor_registration'
    post 'tutors' => 'tutors/registrations#create', as: 'tutor_registration'
    get 'tutors/password/new' => 'tutors/passwords#new', as: 'new_tutor_password'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
