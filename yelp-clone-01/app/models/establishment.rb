class Establishment < ActiveRecord::Base
    has_many :reviews
    #scope by_name  order(:name)
    def average_rating
        reviews.average('ratings') || 'Unrated'
        # return 'Unrated' if reviews.none?
        
        # total = reviews.reduce(0) {|sum, review|
        #   sum += review.ratings
        # }
        # (total / reviews.length)
    end
    alias_method :ratings, :average_rating
end
