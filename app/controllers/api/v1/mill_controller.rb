class Api::V1::MillController < ApplicationController
  def index
    mills = Mill.all
    render json: lathes, status: 'success'
  end

  def create
    mill = Mill.new(mill_params)
    if Mill.save
      render json: mill, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
    mill = Mill.find(params[:id])
    render json: mill
  end

  def update
    mill = Mill.find(params[:id])
    if Mill.update(mill_params)
      render json: mill, status: :updated
    else
      head :unprocessable_entity
    end
  end

  def destroy
    mill = Mill.find(params[:id])
    if mill.destroy
      render json: { success: true }
    else
      head :unprocessable_entity
    end
  end

  private

  def mill_params
    params.require(:mill).permit(:tool_number ,:holder,:sub_holder,:tool_description,:flutes,:diamater,:insert,:protrusion,:coolant,:user_id)
  end
end
