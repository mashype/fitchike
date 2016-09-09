class BlogcommentsController < ApplicationController


	def create
		@post = Post.find(params[:post_id])		
		@blogcomment = @post.blogcomments.create(blogcomment_params)

		redirect_to post_path(@post)

	end

	def destroy
		@post = Post.find(params[:post_id])
		@blogcomment = @post.blogcomments.find(params[:id])
		@blogcomment.destroy

		redirect_to post_path(@post)
	end

  private

    def blogcomment_params
      params.require(:blogcomment).permit(:user_id, :body)
    end

end
