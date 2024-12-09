ActiveAdmin.register Meal do
  # Permitting parameters for form submission
  permit_params :name, :description, :price, :image, :availability

  # Index page configuration
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :availability
    column :created_at
    actions
  end

  # Show page configuration
  show do |meal|
    attributes_table do
      row :name
      row :description
      row :price
      row :availability
      row :image do |meal|
        if meal.image.attached?
          image_tag url_for(meal.image), size: "200x200"
        else
          "No image uploaded"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  # Form configuration
  form do |f|
    f.inputs "Meal Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :availability
      f.input :image, as: :file
    end
    f.actions
  end

  member_action :toggle_availability, method: :put do
    meal = Meal.find(params[:id])
    meal.update(availability: !meal.availability)
    redirect_to admin_meals_path, notice: "Meal availability updated!"
  end
  
  action_item :toggle_availability, only: :show do
    link_to "Toggle Availability", toggle_availability_admin_meal_path(meal), method: :put
  end
end
