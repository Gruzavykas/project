class ArticlesController < ApplicationController
respond_to :html, :json
	

	def show
    	@article = Article.find(params[:id])
    	@bandom = @article.text
    	@words = @bandom.split
		frequencies = Hash.new ( 0 )
		@words.each { |words| frequencies[words] += 1 }
		frequencies = frequencies.sort_by { |words, count| count }
		frequencies.reverse!
		@top3 = frequencies[0..2].each {|name, count| name = count}
		@result = {}
		@top3.each { |k, v| @result[k] = v}

  	end

  	def new 
	end

	def create
		@article = Article.new(article_params)
 
  		@article.save
  		redirect_to @article
	end

	private
  		def article_params
    		params.require(:article).permit(:title, :text)
  		end
end
