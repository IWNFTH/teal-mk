class OpportunitiesController < ApplicationController
  before_action :authenticate_user!, only: :new
  require 'csv'

  def index
    @opportunities = Opportunity.all
    @opportunity = Opportunity.new
    @q = Opportunity.ransack(params[:q])
    @opportunities = @q.result
    respond_to do |format|
      format.html
      format.csv do |_csv|
        send_opportunities_csv(@opportunities)
      end
    end
  end

  def create
    Opportunity.create(opportunity_params)
    @opportunities = Opportunity.all
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
    @comments = @opportunity.comments.includes(:user)
    @comment = Comment.new
  end

  def update
    @comment = Comment.new
    @opportunity = Opportunity.find(params[:id])
    @opportunity.update(opportunity_edit_params)
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

  def opportunity_edit_params
    params.require(:opportunity).permit(:op_name, :company, :person_in_charge, :date_of_obtaining, :date_of_participation, :phase_id,
                                        :date_of_negotiation, :estimated_sales_amount, :sales_amount, :contracted_date, :lost_order_date, :company_area_id, :free_text)
                                        .merge(@opportunity.set_profit)
  end

  def send_opportunities_csv(opportunities)
    csv_data = CSV.generate do |csv|
      column_names = %w[案件名 会社名 エリア 担当者 案件取得日 成約日 予定概算売上 確定概算売上 予定粗利益 確定粗利益]
      csv << column_names
      opportunities.each do |op|
        column_values = [
          op.op_name,
          op.company,
          op.company_area.name,
          op.user.name,
          op.date_of_obtaining,
          op.contracted_date,
          op.estimated_sales_amount,
          op.sales_amount,
          op.estimated_approximate_profit,
          op.approximate_profit
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: '案件一覧.csv')
  end
end
