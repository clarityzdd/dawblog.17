class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate, except: [:index, :show]


  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.con_titulo(params[:buscar])
    if @articles.present?
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js {render 'fallo_articulos.js.erb'}
      end      
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    redirect_to({action: :index}, notice: 'art no encontrado') unless @article
   
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
   @article = current_user.articles.find_by_id(params[:id])
   redirect_to root_path, alert: "op. no permitida" unless @article
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = current_user.articles.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :location, :excerpt, :body, :published_at,:foto)
    end
end
