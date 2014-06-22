class AdminController < ApplicationController

	before_action :admin_user

  	def index
  		
  	end

    def edit_file
        @content = ""
        @file_path = ""
    end

  	def show_file
  		@file_path = params[:file_path]
  		
      if (File.exist?(@file_path))
        file = File.open(@file_path)
  		  @file_content = file.read()
  		  file.close()
        flash.now[:notice] = "Файл открыт"
      else
        file = File.new(@file_path, "w")
        @file_content = ""
        flash.now[:notice] = "Файл создан"
      end

  		render "edit_file"
  	end

  	def save_file
		@file_path = params[:file_path]
		@file_content = params[:file_content]

  		file = File.open(@file_path, "w")  
  		file.write(@file_content)  		
  		file.close()

        flash.now[:notice] = "Данные сохранены"

  		render "edit_file"
  	end

  	private

  		def admin_user	
  			redirect_to(root_url) unless signed_in?
  			redirect_to(root_url) unless current_user().admin?
  		end

end
