module ReviewsHelper
  def review_color(review)
    case review.ratings
    when 1..2
      'alert-danger'
    when 3..4
      'alert-warning'
    when 5
      'alert-success'
    end
  end

  def star_rating(review)
    rating = review.ratings
    return "Unrated" if rating == 'Unrated'
    empty_stars = 5 - rating
    ('★' * rating) + ('☆' * empty_stars)
  end
end
