class FlavorsController < ApplicationController
  def index
    @flavors = Flavor.all
  end

  def show
    @flavor = Flavor.find(params[:id])
    @comments = @flavor.comments.includes(:user).order(created_at: :desc)
  end
end
