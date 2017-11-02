Rails.application.routes.draw do
  resources :braintree_merchants do
    collection do
      get :client_id
      post :onboard
      post :update_merchant
    end
  end
end
