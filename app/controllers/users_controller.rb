class UsersController < ApplicationController
  include Wicked::Wizard
  steps :person_info, :profession_info, :find_friends, :show_profile

  # GET users/:user_id/profile
  def profile
    @user = current_user
  end

  # POST users/:user_id/setup_profile
  def setup_profile
    @use = current_user
    case steps
    when :person_info
    when :profession_info
    when :show_profile
    end
  end
end
