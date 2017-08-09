Rails.application.routes.draw do


  resources :partners, only: [:index, :show, :create, :destroy] do
    get 'page/:page', action: :index, on: :collection
  end

  resources :documents, path: 'document', only: [:destroy] do
    post 'upload', action: :upload, on: :collection
    get 'download', action: :download, on: :member
  end

  root to: redirect('/partners')
end
