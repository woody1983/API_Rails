module API
  class ZombiesController < ApplicationController
    def index
      zombies = Zombie.all
        if bios = params[:bio]
          zombies = zombies.where(bio: bios)
        end
      render json: zombies, status: 200
    end

    def show
      zombie = Zombie.find(params[:id])
      render json: zombie, status: 200
    end

  end
end
