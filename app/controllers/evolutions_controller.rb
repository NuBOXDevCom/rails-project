class EvolutionsController < ApplicationController
  load_and_authorize_resource param_method: :evolution_params

  def index
    @evolutions = current_user.evolutions.all
    @evolution_infos = evolution_infos
  end

  def new
    @evolution = current_user.evolutions.new
  end

  def edit
  end

  def create
    @evolution = current_user.evolutions.new(evolution_params)
    if @evolution.save
      redirect_to evolutions_path, success: 'Evolution Ajoutée avec succès'
    else
      render :new
    end
  end

  def update
    if @evolution.update(evolution_params)
      redirect_to evolutions_path, success: 'Evolution modifiée avec succès'
    else
      render :edit
    end
  end

  def destroy
    @evolution.destroy
    redirect_to evolutions_url, success: 'Evolution supprimée avec succès'
  end

  private

  def evolution_params
    params.require(:evolution).permit(:week_number, :year, :size_neck, :size_chest, :size_west, :size_hips, :size_arms, :size_legs, :size_calves, :weight)
  end

  def get_imc(weight, height)
    (weight / (height.to_f / 100 * height.to_f / 100)).to_f.round(2)
  end

  def get_img(age, gender, imc)
    (gender === 'M') ? gender = 1.0 : gender = 0.0
    ((1.20 * imc) + (0.23 * age) - (10.8 * gender) + 5.4).to_f.round(2)
  end

  def get_p_ideal(height, gender)
    (gender === 'M') ? gender = 6.50 : gender = 4.0
    (height.to_f - 100 - (height.to_f - 150) / gender).to_f.round
  end

  def evolution_infos
    last_evolution = current_user.evolutions.where(user_id: current_user.id).order(id: :desc).first
    current_user.height = nil if current_user.height === 0
    if !current_user.height.nil? && !current_user.birthday.nil? && !current_user.gender.nil? && !last_evolution.nil?
      age = Date.current.year - current_user.birthday.year
      imc = get_imc(last_evolution[:weight], current_user.height)
      img = get_img(age, current_user.gender, imc)
      p_ideal = get_p_ideal(current_user.height, current_user.gender)
      return {
          age: age,
          imc: imc,
          img: img,
          p_ideal: p_ideal
      }
    end
    nil
  end
end
