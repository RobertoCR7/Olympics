class EmojisController < ApplicationController
    def index
        @emojis = Emoji.all
    end
    # GET /emojis/1
    def show
        redirect_to root_url
    end
    # GET /emojis/new
    def new
        @emoji = Emoji.new
    end
    # GET /emojis/1/edit
    def edit
        redirect_to root_url
    end
    # POST /emojis
    def create
        @emoji = Emoji.new(emoji_params)
        @emoji.save
    end
    # PATCH/PUT /emojis/1
    def update
        @emoji.update(emoji_params)
    end
    # DELETE /emojis/1
    def destroy
        @emoji.destroy
    end
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def emoji_params
        params.require(:emoji).permit!
    end
end
