class PostsController < ApplicationController
  # GET /posts
  def index
    # render json: {
    #   sample_post: {
    #     title: "Sample", 
    #     body: "This is a sample for Postman"
    #   }
    # }
    render json: Post.all
  end


  # GET /posts/:post_id
  def show
    binding.pry
    render json: @post
  end


  # POST /posts
  def create
    post = Post.create(post_params)

    if post.save
      render json: post
    else
      render post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:post_id
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:post_id
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(
        :title,
        :body
      )
    end
end
