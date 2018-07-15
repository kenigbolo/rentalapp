class CreditCardService
    def initialize(params)
        @listing = params[:listing]
        @start_date = params[:start_date]
        @end_date = params[:end_date]
    end

    private

    attr_reader :listing, :start_date, :end_date
end