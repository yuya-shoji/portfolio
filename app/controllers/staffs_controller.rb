class StaffsController < ApplicationController
  before_action :authenticate_customer!
  def show
    @admin = Admin.find(params[:id])
  end

end
