class SearchesController < ApplicationController
  before_action :retrieve_available_listings, only: :index

  def index
    @listing_service = ListingService.new(search_params)
    @listings = @listings.paginate(page: params[:page])
  end

  def create
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]
    redirect_to search_results_path(
      search: { start_date: start_date, end_date: end_date }
    )
  end

  private

  def search_params
    params.require(:search).permit(:start_date, :end_date)
  end

  def retrieve_available_listings
    @listings = Listing.where(available: true).includes(:seasonal_rate)
  end
end
