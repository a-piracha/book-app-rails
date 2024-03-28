Rails.application.routes.draw do
  root "static_pages#home"

  # Authors

  resources :authors
  # get "/authors", to: "authors#index", as:"author"
  # get "/authors/new", to: "authors#new", as:"new_author"
  # get "/authors/:id", to:"authors#show", as: "show_author"
  # post "/authors", to: "authors#create", as:"create_author"
  # get "/authors/:id/edit", to:"authors#edit", as: "edit_author"
  # patch "/authors/:id", to: "authors#update", as:"update_author"


  # Biography

  get "/authors/:id/new_bio", to: "authors#new_bio", as:"biography"
  post "/authors/:id/new_bio", to: "authors#create_bio", as:"create_biography"
  get "/authors/:id/edit_bio", to:"authors#edit_bio", as: "edit_biography"
  patch "/authors/:id/edit_bio", to: "authors#update_bio", as:"update_biography"

  # Books

  resources :books
  # get "/books", to: "books#index", as:"book"
  # get "/books/new", to: "books#new", as:"new_book"
  # get "/books/:id", to:"books#show", as: "show_book"
  # post "/books", to: "books#create", as:"create_book"
  # get "/books/:id/edit", to:"books#edit", as: "edit_book"
  # patch "/books/:id", to: "books#update", as:"update_book"


  # Publisher

  # get "/publishers", to: "publishers#index", as:"publisher"
  # get "/publishers/new", to: "publishers#new", as:"new_publisher"
  # post "/publishers", to: "publishers#create", as:"create_publisher"
  # get "/publishers/:id/edit", to:"publishers#edit", as: "edit_publisher"
  # patch "/publishers/:id", to: "publishers#update", as:"update_publisher"
  # delete "/publishers/:id", to: "publishers#destroy", as:'destroy_publishers'

  resources :publishers

  # Genre

  resources :genres

  # get "/genres", to: "genres#index", as:"genre"
  # get "/genres/new", to: "genres#new", as:"new_genre"
  # post "/genres", to: "genres#create", as:"create_genre"
  # get "/genres/:id/edit", to:"genres#edit", as: "edit_genre"
  # patch "/genres/:id", to: "genres#update", as:"update_genre"
  # get "/genres/:id", to:"genres#show", as: "show_genre"
  # delete "/genres/:id", to: "genres#destroy", as:'destroy_genre'

  # Users

  get "/users", to: "users#index", as:"chat_app"
  get "/new", to: "users#new"
  get "/users/:id", to:"users#show", as: "show_user"
  post "/users", to: "users#create", as:"create_user"


  # Messages

  get "/users/:sender_id/with_user/:receiver_id", to: "conversations#new", as: "new_conversation"
  post "/users/:sender_id/with_user/:receiver_id", to: "conversations#create", as: "create_message"

end
