class OpportunitiesController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @opportunities = Opportunity.all
    @opportunity = Opportunity.new
  end

  def new
    @opportunity = Opportunity.new
  end

  def create
    Opportunity.create(opportunity_params)
    @opportunities = Opportunity.all
    
    # @opportunity = Opportunity.new(opportunity_params)
    # if @opportunity.save
      # redirect_to root_path
    # else
      # render :new
    # end
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
    @comments = @opportunity.comments.includes(:user)
    @comment = Comment.new
  end

  def update
    @opportunity = Opportunity.find(params[:id])
    @opportunity.update(opportunity_params)
    if @opportunity.save
      redirect_to edit_opportunity_path
    else
      render :edit
    end
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:user_id, :op_name, :company, :person_in_charge, :date_of_obtaining, :date_of_participation, :phase_id,
      :date_of_negotiation, :estimated_sales_amount, :sales_amount, :contracted_date, :lost_order_date, :company_area_id, :free_text).merge(user_id: current_user.id)
  end

end
