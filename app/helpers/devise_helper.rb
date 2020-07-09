module DeviseHelper
    def devise_error_messages!
      return flash[:alert] if flash[:alert].present?
      resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    end
end