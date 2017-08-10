class PartnersController < ApplicationController
  before_action :find_partner, only: [:show, :destroy]

  def index
    @partners = Partner.order(updated_at: :desc).page(params[:page]).per(params[:per] || 10)
    @partner = Partner.new
  end

  def show
    @documents = @partner.documents.order(updated_at: :desc).page(params[:page]).per(params[:per] || 10)
    @document = Document.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      @partners = Partner.order(updated_at: :desc).page(params[:page]).per(params[:per] || 10)
      @result = { code: 1, message: 'Partner was successfully created.'}
    else
      @result = { code: 0, message: @partner.errors.messages }
    end
  end

  def destroy
    @partner.destroy
    flash[:success] = "Partner was successfully deleted."
    respond_to do |format|
      format.html { redirect_to partners_path }
      format.json { head :no_content }
    end
  end

  private

  def find_partner
    @partner = Partner.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit(:name, :url)
  end

end
