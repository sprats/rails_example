class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "admin", password: "pass", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
    new_params = article_params
    #new_params[:tags_list] = params[:article][:tags_list].split(',')

    @article = Article.new(new_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

    new_params = article_params
		#new_params[:tags_list] = params[:article][:tags_list].split(',')

    if @article.update(new_params)
      redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
    	@article = Article.find(params[:id])
    	@article.destroy
 
    	redirect_to articles_path
	end

	#def tag
	#	@articles = Article.articles_for params[:tag]
	#
	#	respond_to do |format|
	#		format.html { render "index" }
	#		format.xml { render :xml => @articles }
	#	end
	#end

	private
		def article_params
      params.require(:article).permit(:title, :text, :tags_list )
      #params.require(:article).permit({:tags => []})
        #params.require(:article).permit(:title, :text, :tags )
		end
end