class Slide < ActiveRecord::Base
  mount_uploader :slide, SlideUploader
end
