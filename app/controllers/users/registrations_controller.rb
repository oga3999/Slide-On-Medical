class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end

  # protected
  # def update_resource(resource, params)
  #   resource.update_without_current_password(params)
  # end

end
