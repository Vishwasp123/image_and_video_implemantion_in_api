class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :address, :images_url


#add has_many_images in user ietrasation one by one images_url. user map beacause update imaegs url
  def images_url
    object.images.map do |image|
     Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
   end
 end
end
