class PromosController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
  def mispromos
    
  end

  def index
    @promos = Promo.all
    #@promos = Promo.where("created_at > ?", Time.now-7.days)
  end
  def show
    @promo = Promo.find(params[:id])
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
