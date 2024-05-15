class User < ApplicationRecord
	has_many_attached :images
  has_one_attached :video


  def self.ransackable_associations(auth_object = nil)
    ["images_attachments", "images_blobs", "video_attachment", "video_blob"]
 end

 def self.ransackable_attributes(auth_object = nil)
    ["address", "age", "created_at", "id", "id_value", "name", "updated_at"]
 end

end
