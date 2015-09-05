json.array!(@reviews) do |review|
  json.extract! review, :id, :rating, :review_content, :date_time
  json.url review_url(review, format: :json)
end
