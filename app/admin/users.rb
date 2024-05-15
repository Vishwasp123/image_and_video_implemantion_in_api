ActiveAdmin.register User do
  permit_params :name, :age, :address, :video, images: []

  form do |f|
    f.inputs do 
      f.input :name
      f.input :age 
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :video, as: :file
      f.input :address 
    end
    f.actions
  end

  show do 
    attributes_table do 
      row :name
      row :age 
      row :address
      row :images do |user|
        if user.images.attached?
          user.images.each do |image|
            span do 
              image_tag url_for(image), size: '200x200'
            end
          end
        end
      end
      row :video do |user|
        if user.video.attached?
          video_tag url_for(user.video), controls: true, size: '200x200'
        end
      end
    end
  end
  
  index do 
    selectable_column
    id_column
    column :name 
    column :age 
    column :address
    column :images do |user|
      if user.images.present?
        user.images.each do |image|
          span do
            link_to url_for(image), target: "_blank" do
              image_tag url_for(image), size: '50x50', alt: "images"
            end
          end
        end
      end
    end
    column :video do |user|
      if user.video.attached?
        link_to url_for(user.video) do 
          video_tag url_for(user.video), controls: true, size: '100x100'
        end
      end
    end
    actions
  end
end
