module ListingsHelper
  def availability(listing)
    return "Yes" if listing.available
    "No"
  end
end
