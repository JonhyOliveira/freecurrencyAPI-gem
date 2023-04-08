require 'freecurrencyAPI/API'

describe FreeCurrencyAPI::API do

    api = FreeCurrencyAPI::API.new "L2F8vYHbipJR61Q8a1UZphSgQMTLAohZIMYeBjJ5"

    it "provides currencies" do
        ex_rates = api.latest_exchange_rates
        expect(ex_rates.is_a? Hash)
    end

    it "provides currency info" do
        curr_info = api.available_currencies
        expect(curr_info.is_a? Hash)
    end

end