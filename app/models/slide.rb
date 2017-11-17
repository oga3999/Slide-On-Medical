class Slide < ActiveRecord::Base
  acts_as_taggable
  mount_uploader :slide, SlideUploader
  validates :title, :slide, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
