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

  def get_items
    # get_items_params = params.require(:meal).permit(:id)
    @items = Meal.find(params[:id]).menu_items
    render json: @items
  end

  def add_item
    add_item_params = params.require(:meal).permit(:menu_item_id)
    # p add_item_params
    @new_item = MealItem.new(meal_id: params[:id], menu_item_id: add_item_params[:menu_item_id])
    if @new_item.save
      head :created
    else
      render @new_item.errors, status: :unprocessable_entity
    end
  end

  def delete_item
    delete_item_params = params.require(:meal).permit(:menu_item_id)
    @dead_item = MealItem.find_by(meal_id: params[:id], menu_item_id: delete_item_params[:menu_item_id])
    @dead_item.destroy
    head :no_content
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
