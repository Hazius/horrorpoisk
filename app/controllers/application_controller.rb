class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  	def label(method, text = nil, options = {}, &block)
  		lv_required = @object.class.validators_on(method).map(&:class).include? ActiveRecord::Validations::PresenceValidator		
  	
  		lv_label = @template.label(@object_name, method, text, objectify_options(options), &block)
  		lv_label += "*" if lv_required
  		return lv_label
	end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

	before_action :set_locale

  	protect_from_forgery with: :exception

  	include SessionsHelper
 
	def set_locale
  		I18n.locale = params[:locale] || "ru"
	end

end