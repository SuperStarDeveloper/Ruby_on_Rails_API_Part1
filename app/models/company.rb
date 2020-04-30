class Company < ApplicationRecord
    mount_uploader :logo, AvatarUploader
  has_many :users
end
