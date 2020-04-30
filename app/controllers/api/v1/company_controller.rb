class Api::V1::CompanyController < ApplicationController
  def index
    companies = Company.all
    render json: companies, status: 'success'
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: 'created'
    else
      head :unprocessable_entity
    end
  end

  def show
    company = Company.find(params[:id])
    render json: company
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      render json: company, status: :updated
    else
      head :unprocessable_entity
    end
  end

  def destroy
    company = Company.find(params[:id])
    if company.destroy
      render json: { success: true }
    else
      head :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name ,:logo)
  end
end
