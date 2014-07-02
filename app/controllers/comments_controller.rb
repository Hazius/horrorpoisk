class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(comment_params)
    if params[:commit] == "Положительный"
      @comment.liked = "true"
    elsif params[:commit] == "Отрицательный"
      @comment.liked = "false"
    end
    @comment.save
    #redirect_to @comment, notice: 'Comment was successfully created.'
    redirect_to film_path(@comment.film) 
  
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      redirect_to @comment, notice: 'Comment was successfully updated.' 
      render action: 'edit' 
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
      redirect_to comments_url
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :film_id, :liked, :text)
    end
end