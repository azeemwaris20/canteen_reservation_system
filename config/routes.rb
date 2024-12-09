Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  # Role-specific dashboards
  authenticated :user, ->(u) { u.student? } do
    root to: 'students#dashboard', as: :student_root
  end

  authenticated :user, ->(u) { u.canteenstaff? } do
    root to: 'canteen_staffs#dashboard', as: :canteen_staff_root
  end

  # Default root path
  root to: 'home#index'
end
