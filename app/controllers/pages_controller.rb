class PagesController < ApplicationController
    def home
        render plain: "Welcome to car market"
    end

    def not_found
        render plain: "not found"
    end
end