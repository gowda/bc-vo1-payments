# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :contracts, only: [] do
        resources :payments, only: %i[index create]
      end
    end
  end
end
