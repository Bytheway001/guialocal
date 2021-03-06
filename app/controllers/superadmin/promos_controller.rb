class Superadmin::PromosController < Superadmin::ApplicationController
  before_action :set_promo, only: [:edit, :update, :destroy]


  def index
    @promos = Promo.all.order(created_at: :desc)
  end

  def edit

  end

  def update
    respond_to do |format|
      if @promo.update(promo_params)
        format.html { redirect_to superadmin_promos_path, notice: 'La promoción se ha actualizado con éxito' }
        format.json { render :show, status: :ok, location: @promo }
      else
        format.html { render :edit }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promo.destroy
    respond_to do |format|
      format.html { redirect_to superadmin_promos_path, notice: 'Promoción destruida.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_promo
    @promo = Promo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def promo_params
    params.require(:promo).permit(:titulo, :imgpromo, :texto, :validez)
  end

end
