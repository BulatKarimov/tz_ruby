Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :solutions, only: %i[] do
        collection do
          post :solve
        end
      end
    end
  end

  match '*path', via: [:options], to: ->(_) { [204, { 'Content-Type' => 'text/plain' }, []] }
end
