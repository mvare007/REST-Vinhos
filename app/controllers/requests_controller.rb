class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @request = Request.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(
      :name,
      :description,
      :image_url,
      :variant,
      :country,
      :region,
      :volume,
      :maker
    )
  end
end
