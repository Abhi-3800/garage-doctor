ActiveAdmin.register Car do

  permit_params :mfg_company, :car_model, :mfg_year, :car_description, :horse_power, :top_speed, :transmission, :drive_type, :car_price, images: []
  
  filter :mfg_company
  filter :mfg_year
  filter :drive_type, as: :select, collection: -> { Car.drive_types.keys.map { |key| [key.humanize, key] } }
  filter :transmission, as: :select, collection: -> { Car.transmissions.keys.map { |key| [key.humanize, key] } }

  show do
    attributes_table do
      row :mfg_company
      row :car_model
      row :mfg_year
      row :horse_power
      row :top_speed
      row :transmission
      row :drive_type
      row :car_price
      row :car_description
      row "Car Images" do |car|
        div class: 'car-images' do
          car.images.each do |img|
            span do
              image_tag url_for(img), size: "200x150", style: "margin-right: 10px;"
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs 'Car Details' do
      f.semantic_errors *f.object.errors
      f.input :mfg_company
      f.input :car_model
      f.input :mfg_year, as: :date_picker, label: 'Manufacturing Year', input_html: { class: 'date-picker', min: '2015-01-01' }
      f.input :horse_power, label: "Horse Power(N/m)"
      f.input :top_speed, label: "Top Speed(km/hr)"
      f.input :transmission, as: :select, collection: Car.transmissions.keys
      f.input :drive_type, as: :select, collection: Car.drive_types.keys
      f.input :car_price, label: "Car Price(Lakhs)"
      f.input :car_description
      f.input :images, as: :file, input_html: { multiple: true }
      if resource.images.attached?
        f.inputs "Uploaded Images", :multipart => true do 
          car.images.each do |img|
            span do
              image_tag url_for(img), size: "200x150", style: "margin-right: 10px;"
            end
          end
        end
      end
    end
    f.actions
  end
end
