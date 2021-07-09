module Admin::V1
  class UsersController < ApiController
    before_action :load_user, only: [:show, :update, :destroy]

    def index
      @loading_service = Admin::ModelLoadingService.new(User.all, searchable_params)
      @loading_service.call
    end

    def show; end

    def create
      @user = User.new
      @user.attributes = user_params
      save_user!
    end


    def update
      @user.attributes = user_params
      save_user!
    end

    def destroy
      @user.destroy!
    rescue
      render_error(fields: @user.errors.messages)
    end

    private

    def searchable_params
      params.require(:user).permit({ search: :name }, { order: {} }, :page, :length)
    end

    def save_user!
      @user.save!
      render :show
    rescue
      render_error(fields: @user.errors.messages)
    end

    def user_params
      return {} unless params.has_key?(:user)
      params.require(:user).permit(:provider, :uid, :name, :email, :profile)
    end

    def load_user
      @user = User
      .find(params[:id])
    end
  end
end