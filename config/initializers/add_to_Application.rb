module Scary
  class Application
  	#config.action_view.default_form_builder = ApplicationHelper::LabellingFormBuilder
  	ActionView::Base.default_form_builder = ApplicationHelper::LabellingFormBuilder
  end
end