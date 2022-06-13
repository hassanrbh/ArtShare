module Taggable
    # This line makes our module taggable a concern
    extend ActiveSupport::Concern

    included do
        # in this tag we can add associations and validations
        has_many :taggings, as: :taggable
        has_many :tags, through: :taggings
        
        validates :tags, presence: true
    end

    # for class methods
    module ClassMethods
        def by_tag_name(tag_name)
            self.joins(:tags).where('tags.name' => tag_name)
        end
    end
    
end