class Superadmin::ApplicationController < ApplicationController
  before_action :authorize_superadmin!

    def index
      @users = User.all
      @empresas = Empresa.all
      @categories = Category.all
      @tags = Tag.all
      @eventos = Evento.all
      @promos = Promo.all
      @incidents = Incident.all
      @destacados = Destacado.all
      @proposals = AchievementProposal.all
      @puntos = Punto.all
      @maps = Map.all
    end

    private
    def authorize_superadmin!
      authenticate_user!
      unless (current_user.superadmin?)
        redirect_to root_path, alert: "Tú no eres superadministrador."
      end
    end
  end
