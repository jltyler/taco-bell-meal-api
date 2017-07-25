class MealsController < ProtectedController
  before_action :set_meal, only: [:show, :update, :destroy]

  # GET /meals
  def index
    @meals = current_user.meals.all

    render json: @meals
  end

  # GET /meals/1
  def show
    render json: @meal
  end

  # POST /meals
  def create
    @meal = current_user.meals.build(meal_params)

    if @meal.save
      render json: @meal, status: :created, location: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      render json: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
  end

  # GET /meal-items/1
  def get_items
    @items = current_user.meals.find(params[:id]).menu_items
    render json: @items
  end

  # POST /add-item/1
  def add_item
    @meal = current_user.meals.find(params[:id])
    if @meal
      add_item_params = params.require(:meal).permit(:menu_item_id)
      @new_item = MealItem.new(meal_id: params[:id], menu_item_id: add_item_params[:menu_item_id])
      if @new_item.save
        @menu_item = MenuItem.find(add_item_params[:menu_item_id])
        render json: @menu_item, status: :created
        # head :created
      else
        render @new_item.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /delete-item/1
  def delete_item
    @meal = current_user.meals.find(params[:id])
    if @meal
      delete_item_params = params.require(:meal).permit(:menu_item_id)
      @dead_item = MealItem.find_by(meal_id: params[:id], menu_item_id: delete_item_params[:menu_item_id])
      if @dead_item
        @dead_item.destroy
        head :no_content
      else
        head :not_found
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def meal_params
    params.require(:meal).permit(:name)
  end
end
