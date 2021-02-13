Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  resources :appointments, only: [:edit, :index, :update, :new, :create]
  match '/patients/profile/:id', to: 'patients#show', via: 'get'
  match '/doctors', to: 'doctors#index', via: 'get'
  match '/doctors/search', to: 'doctors#search', via: 'get'
  match '/doctors/profile/:id', to: 'doctors#show', via: 'get'
  devise_for :admins, path: 'admins', controllers: {
        sessions: 'admins/sessions', registrations: 'admins/registrations'
      }
  devise_for :doctors, path: 'doctors', controllers: {
        sessions: 'doctors/sessions', registrations: 'doctors/registrations'
      }
  devise_for :patients, path: 'patients', controllers: {
        sessions: 'patients/sessions', registrations: 'patients/registrations'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
