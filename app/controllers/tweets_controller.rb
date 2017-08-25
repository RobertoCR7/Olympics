class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all.order('created_at DESC').take(15)
        @emojitweets = Emojitweet.all
        @emojis = Emoji.all
    end
    # GET /emojis/1
    def show
        redirect_to root_url
    end
    # GET /emojis/new
    def new
        @tweet = Tweet.new
    end
    # GET /emojis/1/edit
    def edit
        redirect_to root_url
    end
    # POST /emojis
    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.save
    end
    # PATCH/PUT /emojis/1
    def update
        @tweet.update(tweet__params)
    end
    # DELETE /emojis/1
    def destroy
        @tweet.destroy
    end
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
        params.require(:tweet).permit!
    end
end
