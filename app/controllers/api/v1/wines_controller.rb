class Api::V1::WinesController < Api::V1::BaseController
  before_action :set_wine, only: [ :show ]

  def index
    @wines = policy_scope(Wine)
  end


   def show
   end

   private

   def set_wine
     @wine = Wine.find(params[:id])
     authorize @wine  # For Pundit
   end
end
