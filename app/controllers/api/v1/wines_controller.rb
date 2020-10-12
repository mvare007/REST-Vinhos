class Api::V1::WinesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show, :search]
  before_action :set_wine, only: [:show, :update, :destroy]

  # GET /api/v1/wines
  def index
    @wines = policy_scope(Wine)
  end

  # GET /api/v1/wines/:id
  def show
  end

  # PATCH /api/v1/wines/:id # authenticated
  def update
    if @wine.update(wine_params)
      render :show
    else
      render_error
    end
  end

  # POST /api/v1/wines # authenticated
  def create
    @wine = Wine.new(wine_params)
    @wine.user = current_user
    if @wine.save
      render :show, status: :created
    else
      render_error
    end
  end

  # DELETE /api/v1/wines/:id # authenticated
  def destroy
    @wine.destroy
    head :no_content
  end

  def search
    if params[:name]
      @wines = Wine.search_by_name(params[:name]) # GET/api/v1/wines/name/:name
    elsif params[:origin]
      @wines = Wine.search_by_country(params[:country]) # GET/api/v1/wines/country/:country
    elsif params[:region]
      @wines = Wine.search_by_region(params[:region]) # GET/api/v1/wines/region/:region
    elsif params[:maker]
      @wines = Wine.search_by_maker(params[:maker]) # GET/api/v1/wines/maker/:maker
    end
  end

  private

  def set_wine
    @wine = Wine.find(params[:id])
    authorize @wine
  end

  def wine_params
    params.require(:wine).permit(
      :name,
      :description,
      :image_url,
      :variant,
      :origin,
      :region,
      :grade,
      :maker
    )
  end

  def render_error
    render json: { errors: @wine.errors.full_messages },
      status: :unprocessable_entity
  end
end
