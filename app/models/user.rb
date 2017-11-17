class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

         mount_uploader :avatar, AvatarUploader #deviseの設定配下に追記

  has_many :slides, dependent: :destroy
  has_many :comments, dependent: :destroy
end
