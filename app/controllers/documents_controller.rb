class DocumentsController < ApplicationController
  before_action :find_document, only: [:destroy, :download]

  def upload
    @partner = Partner.find(params[:partner_id])
    params.delete :partner_id
    if @partner.blank?
      flash[:error] = 'Partner is not found'
      redirect_to root_path
    else
      if document_params[:file].blank?
        flash[:error] = "You need to select a file"
        redirect_to partner_path(@partner) && return
      end
      @document = @partner.documents.build(document_params)
      if @document.save
        flash[:success] = 'Document was successfully created.'
        redirect_to partner_path(@partner)
      else
        flash[:error] = @document.errors.messages[:file].first
        redirect_to partner_path(@partner)
      end
    end
  end

  def download
    send_data(@document.file_contents,
              type: @document.content_type,
              filename: @document.filename)
  end

  def destroy
    @document.destroy
    flash[:success] = "Partner was successfully deleted."
    respond_to do |format|
      format.html { redirect_to partner_path(@document.partner) }
      format.json { head :no_content }
    end
  end

  private

  def find_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:file)
  end
end
