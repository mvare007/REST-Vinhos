class Api::V1::WinesController < Api::V1::BaseController
  before_action :set_wine, only: [ :show ]

  # GET /api/v1/wines
  def index
    @wines = policy_scope(Wine)
  end

   # GET /api/v1/wines/:id
   def show
   end

   # GET /api/v1/search/:query
   def search
     @wines = Wine.search_by_term(params[:query])
   end

   private

   def set_wine
     @wine = Wine.find(params[:id])
     authorize @wine  # For Pundit
   end
end
