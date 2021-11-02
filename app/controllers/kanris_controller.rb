class KanrisController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def top
        @newkanris = Kanri.order(created_at: :desc).page(params[:page]).limit(5)
        @notekanris = Kanri.order(impressions_count: :desc).page(params[:page]).limit(5)
    
    end

    def about
    end

    def index
        @kanris = Kanri.order(created_at: :desc).page(params[:page]).per(6)
    end
    
    def nindex
        @kanris = Kanri.order(impressions_count: :desc).page(params[:page]).per(6)
    end

   


    def genre
        @kanris = Kanri.all
        a = []
        @kanris.each do |k|
            a.push(k.genre)
        end
        @genre_arr = a.uniq
        
    end


    def gindex
        @gear = params[:gear].to_s
        
        @kanrisgenre1 = Kanri.where(genre: @gear).page(params[:page]).per(6)
        
    end

  
    def new
        @kanri = Kanri.new   
    end
    
    def create
        kanri = Kanri.new(kanri_params)
        kanri.user_id = current_user.id
        if kanri.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
     end
    
    def show
        @kanri = Kanri.find(params[:id])
        impressionist(@kanri, nil, unique: [:session_hash])
        @random = Kanri.order("RANDOM()").limit(5)

    end
     
    def edit
        @kanri = Kanri.find(params[:id])
    end
     
    
    def update
        kanri = Kanri.find(params[:id])
        if kanri.update(kanri_params)
          redirect_to :action => "show", :id => kanri.id
        else
          redirect_to :action => "new"
        end
    end
    
     
    def destroy
        kanri = Kanri.find(params[:id])
        kanri.destroy
        redirect_to action: :index
    end
      
    
    private
    def kanri_params
        params.require(:kanri).permit(:genre, :title, :body, :url, :image, :alt)
    end
    
    def sort_params
        params.permit(:sort)
    end

end
