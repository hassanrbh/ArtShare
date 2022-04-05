class StaticPagesController < ApplicationController
    layout false
    def home
        render action: "home"
    end
end
