ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :role

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :role
    column :created_at
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: User.roles.keys # For role selection
    end
    f.actions
  end
end
