class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /backoffice/categories
  # GET /backoffice/categories.json
  def index
    @categories = Category.all
  end

  # GET /backoffice/categories/new
  def new
    @category = Category.new
  end

  # GET /backoffice/categories/1/edit
  def edit
  end

  # POST /backoffice/categories
  # POST /backoffice/categories.json
  def create
    @category = CategoryService.create(category_params)

    respond_to do |format|
      unless @category.errors.any?
        format.html { redirect_to backoffice_categories_path,
          notice: notification_alert('success', 'Created!', "Category [#{@category.description}] was successfully created.") 
        }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/categories/1
  # PATCH/PUT /backoffice/categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to backoffice_categories_path,
          notice: notification_alert('success', 'Updated!', "Category [#{@category.description}] was successfully updated.") 
        }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/categories/1
  # DELETE /backoffice/categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_categories_path, 
        notice: notification_alert('success', 'Deleted!', "Category was successfully deleted.") 
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:description, :active)
    end
end
