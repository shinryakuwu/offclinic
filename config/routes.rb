Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors', controllers: {
        sessions: 'doctors/sessions'#,
        #confirmations: 'doctors/confirmations',
        #passwords: 'doctors/passwords',
        #registrations: 'doctors/registrations',
        #unlocks: 'doctors/unlocks',
        #omniauth_callbacks: 'doctors/omniauth_callbacks'
      }
  devise_for :patients, path: 'patients', controllers: {
        sessions: 'patients/sessions'#,
        #confirmations: 'patients/confirmations',
        #passwords: 'patients/passwords',
        #registrations: 'patients/registrations',
        #unlocks: 'patients/unlocks',
        #omniauth_callbacks: 'patients/omniauth_callbacks'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end