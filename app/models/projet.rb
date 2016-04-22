class Projet < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    validate :image_size_validation
    acts_as_commentable
    
    private
      def image_size_validation
          errors[:image] << "L'image doit faire moins de 500KB" if image.size > 0.5.megabytes
      end
end
