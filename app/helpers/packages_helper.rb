module PackagesHelper
  def paypal_url(package)
    #https://developer.paypal.com/docs/classic/paypal-payments-standard/integration-guide/Appx_websitestandard_htmlvariables/#id08A6HH00W2J
    values = {
        business: "#{Figaro.env.merchant}",
        cmd: "_xclick", # Used for a buy now (Once bought, cannot be bought again)
        #cmd: "_donations", # Used to donate
        upload: 1,
        invoice: package.id, # Used to track what package was donated to in the hook
        amount: package.amount,
        item_name: package.title,
        item_number: package.id,
        quantity: '1',
        # Path paypal uses to go back to your site when user clicks return to site after payment
        return: "#{Figaro.env.app_host}#{package_path(package)}",
        # Path paypal uses when the payment went through
        notify_url: "#{Figaro.env.app_host}/hook"
    }
    # Create the whole query to send the user to paypal to pay
    "#{Figaro.env.paypal_host}/cgi-bin/webscr?#{values.to_query}"
  end
end
