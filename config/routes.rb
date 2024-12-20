Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  authenticated :user, ->(u) { u.student? } do
    root to: 'students#dashboard', as: :student_root
    resources :meals, only: [:show]
    resources :reservations, only: [:create, :index, :show]
  end

  authenticated :user, ->(u) { u.canteenstaff? } do
    root to: 'canteen_staffs#dashboard', as: :canteen_staff_root
  end

  root to: 'home#index'
end
