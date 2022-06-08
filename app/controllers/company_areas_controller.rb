class CompanyAreasController < ApplicationController
  def show
    @opportunities = Opportunity.where(company_area_id: params[:company_area_id])
  end
end