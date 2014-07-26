module ApplicationHelper

	class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  	def label(method, text = nil, options = {}, &block)
  		lv_required = @object.class.validators_on(method).map(&:class).include? ActiveRecord::Validations::PresenceValidator		
  	
      if text == nil
        text = @object_name + "*" if lv_required
      else
        text += "*" if lv_required
      end

      super
      
  		#@template.label(@object_name, method, text, objectify_options(options), &block)  		
  
		end
	end

end
