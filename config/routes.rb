Rails.application.routes.draw do
  root 'boards#index'

  resources :boards do
    resources :artists do
    end
  end

  resources :artists do
    resources :songs
end

end