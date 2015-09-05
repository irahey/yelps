class Review < ActiveRecord::Base
    default_scope {order('created_at DESC')} #The default_scope call is important; it orders a list of ribbits in from the most recent to least recent. 
    #attr_accessible :content, :userid
    belongs_to :user
    belongs_to :establishments
    
    validates :content, length: { maximum: 800}
    def valid_ratings
        establishment && establishment.promoted? ? 1..5 : 1..4
    end
end
