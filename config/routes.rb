Rails.application.routes.draw do

  get 'decks/index'

  get 'decks/show'

  get 'decks/new'

  get 'decks/edit'

  get 'decks/create'

  get 'decks/update'

  get 'decks/destroy'

  root 'home#index'
  resources :flashcards, :review
  resources :decks do
    resources :flashcards
    resources :review
  end


  devise_for :users, :controllers => { registrations: 'registrations' }
end