class PagesController < ApplicationController
    # A method for home page 
    def home
        @q = Car.ransack(params[:q])
        @cars = @q.result
    end
    # a method if page is not found
    def not_found
        render plain: "not found"
    end
    # A method for advanced search engine
    def search 
        @cars = Car.all 
        if params[:search].blank?  
            redirect_to(cars_path, alert: "Empty field!") 
          else  
            @parameter = params[:search].downcase  
            @results = Car.all.where("lower(make) LIKE :search", search: @make)  
          end  
    end
end
