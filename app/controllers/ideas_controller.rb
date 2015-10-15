class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #Breaks Admin Delete Privileges

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
    #Follow Logic
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    #Follow Logic
    @comment = Comment.new
  end

  # GET /ideas/new
  def new
    @user = current_user
    @idea = @user.ideas.build
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  def create
    @user = current_user
    @idea = @user.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :image, :tagline, :description, :story, :featured, :poll, user_ids: [])
    end
end
