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
end
