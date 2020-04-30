class Api::V1::LatheController < ApplicationController
  def index
    lathes = Lathe.all
    render json: lathes, status: 'success'
  end

  def create
    lathe = Lathe.new(lathe_params)
    if Lathe.save
      render json: lathe, status: 'success'
    else
      head :unprocessable_entity
    end
  end

  def show
    lathe = Lathe.find(params[:id])
    render json: lathe,status: 'success'
  end

  def update
    lathe = Lathe.find(params[:id])
    if Lathe.update(lathe_params)
      render json: lathe, status: :updated
    else
      head :unprocessable_entity
    end
  end

  def destroy
    lathe = Lathe.find(params[:id])
    if lathe.destroy
      render json: { success: true }
    else
      head :unprocessable_entity
    end
  end

  private

  def lathe_params
    params.require(:lathe).permit(:tool_number ,:holder,:sub_holder,:tool_description,:diamater,:insert,:protrusion,:coolant,:user_id)
  end
end
