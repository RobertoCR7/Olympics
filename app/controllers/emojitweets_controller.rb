class EmojitweetsController < ApplicationController
    def index
        @tweets = Tweet.all.order('emojitweets_count DESC').take(15)
        @emojitweets = Emojitweet.all
        @emojis = Emoji.all
    end
    # GET /emojis/1
    def show
        @tweet=Tweet.find(params[:tweet_id])
        @emojitweet = @tweet.emojitweets.find(params[:id])
    end
    # GET /emojis/new
    def new
        @tweet=Tweet.find(params[:tweet_id])
        @emojitweet = Emojitweet.new
        @emojis=Emoji.all
    end
    # GET /emojis/1/edit
    def edit
        redirect_to root_url
    end
    # POST /emojis
    def create
        @emojitweet = Emojitweet.new(params.permit(:tweet_id, :emoji_id, :user_id))
        @tweet_id = @emojitweet.tweet_id
        if Emojitweet.all.where({tweet_id: @tweet_id, user_id: current_user.id}).exists?
            redirect_to root_path
        else
            @emojitweet.save
            redirect_to root_path
        end
    end
    # PATCH/PUT /emojis/1
    def update
        @tweet= Tweet.find(params[:tweet_id])
        @emojitweet=@tweet.emojitweets.find(params[:id])
        @emojitweet.update!(emojitweet_params)
    end
    # DELETE /emojis/1
    def destroy
        ####This find method finds the first ones that's why you're getting the bug where user's can't delete their own part if one exists before them
        @tweet= Tweet.find(params[:tweet_id])
        @user = User.find(params[:user_id])
        @emojitweet=@tweet.emojitweets.find(params[:id])
        if @emojitweet.user_id == current_user.id
            @emojitweet.destroy
            redirect_to root_path
        else
            flash[:alert] = "Cannot Delete This Reaction"
            redirect_to root_path
        end
    end
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def emojitweet_params
        params.require(:emojitweet).permit!
    end
end
