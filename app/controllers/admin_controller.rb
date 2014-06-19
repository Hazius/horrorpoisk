class AdminController < ApplicationController

	before_action :admin_user

  	def index
  		@content = ""
  		@file_path = ""
  	end

  	def show_file
  		@file_path = params[:file_path]

  		file = File.open(@file_path)
  		@file_content = file.read()
  		file.close()

  		render "index"
  	end

  	def save_file
		@file_path = params[:file_path]
		@file_content = params[:file_content]

  		file = File.open(@file_path, "w")  
  		file.write(@file_content)  		
  		file.close()

        flash.now[:notice] = "Данные сохранены"

  		render "index"
  	end

  	private

  		def admin_user	
  			redirect_to(root_url) unless signed_in?
  			redirect_to(root_url) unless current_user.admin?
  		end

end
