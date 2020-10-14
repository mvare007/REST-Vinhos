class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_request, only: [:edit, :update, :destroy]

  def index
    @request = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    if @request.save
      redirect_to(root_path)
      flash[:notice] = "Thank you for your contribution! It will be reviewed and added to the api soon."
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    @request.update(request_params)
  end

  def destroy
    @request.destroy
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
