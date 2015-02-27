class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :edit]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Company was created"
      redirect_to @events
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      flash[:notice] = "Company was updated"
      redirect_to companies_path
    else
      render :new
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
    flash[:notice] = "Company was destroyed"
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end

end
