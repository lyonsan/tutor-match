class Foreigners::NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update]

  def index
    @needs = Need.all.order(created_at: 'DESC')
  end

  def new
    @need = Need.new
  end

  def create
    @need = Need.new(need_params)
    if @need.save
      redirect_to foreigners_needs_path
    else
      render :new
    end
  end

  private

  def need_params
    params.require(:need).permit(:title, :detail, :remarks).merge(foreigner_id: current_foreigner.id)
  end

  def set_need
    @need = Need.find(params[:id])
  end
end
