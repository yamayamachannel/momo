class SoundboardsController < ApplicationController
    
    
    def new
        @soundboards = Soundboard.all
    end
    
    def edit
    end


    def create
        @soundboard = Soundboard.new(soundboard_params)
        @soundboard.save
        redirect_back(fallback_location: soundboards_path)
        
    # else
            # render 'new'
        # end
    end

    def soundboard_params
        params.permit(:opinion)
    end
end