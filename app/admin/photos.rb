ActiveAdmin.register Photo do
  permit_params :title, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :image do |photo|
        if photo.image.attached?
          image_tag url_for(photo.image), size: '200x200'
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :image do |photo|
      if photo.image.attached?
        image_tag url_for(photo.image), size: '50x50'
      end
    end
    actions
  end
end
