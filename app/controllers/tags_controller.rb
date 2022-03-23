class TagsController < ApplicationController
    def search
        @parameter = params[:search].downcase
        @results = Tag.all.where("lower(tag) LIKE :search", search: "%#{@parameter}%")
    end
end
