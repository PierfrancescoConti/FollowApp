class User < ApplicationRecord
  has_secure_password
  has_many :friends
  mount_uploader :image, AvatarUploader      # tutorial: https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

  validates :password, :presence => true, :on => :update,
 :if => lambda{ !password.nil? }

 validates :password,
  :confirmation => true,
  :length => { :minimum => 8},
  :with => /^(?=.\d)(?=.([a-z]|[A-Z]))([\x20-\x7E])$/,
  :if => lambda{ new_record? || !password.nil? }
end
