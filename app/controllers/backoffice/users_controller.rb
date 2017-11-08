class Backoffice::UsersController < BackofficeController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/users
  # GET /backoffice/users.json
  def index
    @users = User.all
  end

  # GET /backoffice/users/1
  # GET /backoffice/users/1.json
  def show
  end

  # GET /backoffice/users/new
  def new
    @user = User.new
  end

  # GET /backoffice/users/1/edit
  def edit
  end

  # POST /backoffice/users
  # POST /backoffice/users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/users/1
  # PATCH/PUT /backoffice/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/users/1
  # DELETE /backoffice/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
