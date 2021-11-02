class Kanri < ApplicationRecord

    belongs_to :user
    mount_uploader :image, ImageUploader
    is_impressionable counter_cache: true

end
