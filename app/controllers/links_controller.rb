require_relative '../services/shortener'

class LinksController < ApplicationController
  before_action :set_link, only: %i[destroy]
  before_action :authenticate_user!

  # GET /links or /links.json
  def index
    @links = Link.where(user_id: current_user.id)
  end

  # GET /links/1 or /links/1.json
  def show
    @link = Link.find_by(lookup_code: params[:lookup_code])
    redirect_to @link.original_url, allow_other_host: true
  end

  # POST /links or /links.json
  def create
    shortener = ShortenerService.new(link_params[:original_url], link_params[:name], current_user.id)
    @link = shortener.generate_short_link

    redirect_to '/links'
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url, notice: 'El link fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:original_url, :name)
  end
end
