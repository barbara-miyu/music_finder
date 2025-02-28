class SonganswersController < ApplicationController
    before_action :authenticate_user!  
    def create
      songquestion = Songquestion.find(params[:songquestion_id])
      songanswer = songquestion.songanswers.build(songanswer_params) 
      songanswer.user_id = current_user.id
      if songanswer.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
    
    private
    
      def songanswer_params
        params.require(:songanswer).permit(:content)
      end     
        
end
