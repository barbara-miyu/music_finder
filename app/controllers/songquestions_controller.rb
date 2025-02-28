class SongquestionsController < ApplicationController
    def index
        @songquestions = Songquestion.all
      end
    
      def new
        @songquestion = Songquestion.new
      end
    
      def create
        songquestion = Songquestion.new(songquestion_params)
        songquestion.user_id = current_user.id
        if songquestion.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @songquestion = Songquestion.find(params[:id])
        @songanswers = @songquestion.songanswers
        @songanswer = Songanswer.new
      end
        
      def edit
        @songquestion = Songquestion.find(params[:id])
      end
    
      def update
        songquestion = Songquestion.find(params[:id])
        if songquestion.update(songquestion_params)
          redirect_to :action => "show", :id => songquestion.id
        else
          redirect_to :action => "new"
        end
      end
    
      def destroy
        songquestion = Songquestion.find(params[:id])
        songquestion.destroy
        redirect_to action: :index
      end
    
      private
      def songquestion_params
        params.require(:songquestion).permit(:content)
      end
    
end
