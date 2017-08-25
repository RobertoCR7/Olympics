class CommentsController < ApplicationController
    # GET /comments
    def index
        @tweet = Tweet.find(params[:tweet_id])
        @comments = Comment.all
        @emojis= Emoji.all
        @emojitweets = Emojitweet.all
    end
    # GET /comments/1
    def show
        redirect_to root_url
    end
    # GET /comments/new
    def new
        @tweet=Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.new
    end
    # GET /comments/1/edit
    def edit
        @tweet=Tweet.find(params[:tweet_id])
        @comment=@tweet.comments.find(params[:id])
    end
    # POST /comments
    def create
        @tweet= Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:notice] = "Comment Posted"
            redirect_to tweet_comments_path(@tweet)
        else
            render :new
        end
    end
    # PATCH/PUT /comments/1
    def update
        @tweet=Tweet.find(params[:tweet_id])
        @comment=@tweet.comments.find(params[:id])
        @comment.update!(comment_params)
        redirect_to tweet_comments_path(@tweet)
    end
    # DELETE /comments/1
    def destroy
        @tweet=Tweet.find(params[:tweet_id])
        @comment=@tweet.comments.find(params[:id])
        if @comment.user_id == current_user.id
            @comment.destroy
            redirect_to tweet_comments_path(@tweet)
        else
            flash[:alert] = "Cannot Delete This Reaction"
            redirect_to root_path
        end
    end
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit!
    end
end
