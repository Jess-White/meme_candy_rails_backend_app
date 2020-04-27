class Api::V1::MemesController < ApplicationController
  
    # before_action :authenticate_user

    def index 
      @memes = Meme.all

      @memes = @memes.order(id: :asc)

      render 'index.json.jb'
    end

    def create
      @meme = Meme.new(
                            user_id: params[:user_id],
                            meme_name: params[:meme_name],
                            img_url: params[:img_url],
                            top_text: params[:top_text],
                            bottom_text: params[:bottom_text],
                            )
      if @meme.save
        render "show.json.jb"
      else
        render json: {errors: @meme.errors.messages}, status: :unprocessable_entity
      end 
    end 

    def show
      @meme = Meme.find(params[:id])
      render 'show.json.jb'
    end 

    def update
      @meme = Meme.find(params[:id])

      @meme.user_id = params[:user_id] || @meme.user_id
      @meme.meme_name = params[:meme_name] || @meme.meme_name
      @meme.img_url = params[:img_url] || @meme.img_url
      @meme.top_text = params[:top_text] || @meme.top_text
      @meme.bottom_text = params[:bottom_text] || @meme.bottom_text

      @meme.save
      render 'show.json.jb'
    end 

    def destroy
      meme = Meme.find(params[:id])
      meme.destroy
      render json: {message: "Noooooooooooo! They killed Kenny! You BASTARDS!"}
    end 

end
