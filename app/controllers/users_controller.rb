require 'app_utils'
class UsersController < ApplicationController
    # GET /users
    def index
        query = User.order(:created_at => :desc)
        if params[:q].present?
            keyword = AppUtils.escape_search_query(params[:q])
            query = query.where('full_name ILIKE ? OR email ILIKE ?', keyword, keyword)
        end
        @users = query.paginate(:page => params[:page], :per_page => DEFAULT_PER_PAGE)
    end
    def new
        @user = User.new
    end
    def destroy
      logger.debug "Article should be valid123"
    end
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = t('success_message', :resource => t('model.user'), :action => t('action.created'))
          redirect_to users_path
        else
          render :new
        end
      end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:full_name, :email, :role_id, :site_id, :department_id, :disabled, :password, :password_confirmation)
    end
end
