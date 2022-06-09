class PhasesController < ApplicationController
  def show
    @opportunities = Opportunity.where(phase_id: params[:phase_id])
  end
end
