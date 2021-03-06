class FilmsController < ApplicationController

    before_action :set_film, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_film

    def search

        if !params[:name_film_at_search].nil?
            name = params[:name_film_at_search].mb_chars.downcase.to_s
            films_rus = Film.where("name_rus like ?", "%#{name}%")
            films_eng = Film.where("name_eng like ?", "%#{name}%")
            @films = films_rus + films_eng
        elsif !params[:future_in_cinemas].nil? && params[:future_in_cinemas]
            @films = Film.where(future_in_cinemas: true)
        elsif !params[:now_in_cinemas].nil? && params[:now_in_cinemas]
            @films = Film.where(now_in_cinemas: true)  
        end

        render 'index'

    end

    # GET /films
    # GET /films.json
    def index
        #@films = Film.all    
        @films = Film.where(["year >= :year_from and year <= :year_to", 
                            { year_from: params[:year_from], year_to: params[:year_to] }
                            ]) #.paginate(page: params[:page])
    end

    # GET /films/1
    # GET /films/1.json
    def show
        @comments = Comment.delete_moderating(@film.comments.all())
        @comment = @film.comments.new    
    end

    # GET /films/new
    def new
        @film = Film.new
    end

    # GET /films/1/edit
    def edit
    end

    # POST /films
    # POST /films.json
    def create

        @film = Film.new(film_params) 
        if @film.save 
            @film.image = @film.id 
            @film.save 
            redirect_to @film, notice: 'Film was successfully created.' 
        else 
            render action: 'new' 
        end
  
    end

    # PATCH/PUT /films/1
    # PATCH/PUT /films/1.json
    def update

        if @film.update(film_params)
            redirect_to @film, notice: 'Film was successfully updated.'      
        else
            render action: 'edit'      
        end
 
    end

    # DELETE /films/1
    # DELETE /films/1.json
    def destroy
        @film.destroy
        redirect_to films_url
    end

    private

        # Use callbacks to share common setup or constraints between actions.
        def set_film
            @film = Film.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def film_params
            params.require(:film).permit(:name_rus, :name_eng, :producer, 
                                        :year, :russian_premiere, :short_description, 
                                        :full_description, :link_to_kinopoisk, :image, 
                                        :now_in_cinemas, :future_in_cinemas)
        end
        
        def invalid_film
        	redirect_to root_path, notice: "Ошибка поиска фильма"
        end

end
