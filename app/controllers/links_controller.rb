class LinksController < ApplicationController
  before_action :set_link, only: %i[show edit destroy]

  # GET /links or /links.json
  def index
    @links = Link.all
  end

  # GET /links/1 or /links/1.json
  def show; end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit; end

  # POST /links or /links.json
  def create
    shortener = ShortenerService.new(link_params[:original_url])
    @link = shortener.generate_short_link

    if @link.persisted?
      respond_to do |format|
        format.html { redirect_to link_path(@link.lookup_code) }
      end
    else
      render 'home/index'
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
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
    params.require(:link).permit(:original_url)
  end
end
