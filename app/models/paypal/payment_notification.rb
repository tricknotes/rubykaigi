module Paypal
  class PaymentNotification < ActiveRecord::Base
    set_table_name "paypal_payment_notifications"

    class << self
      def from_notified_params(params)
        attrs = params_to_attrs(params,
          [:payment_status, :txn_id, :receipt_id, :tax, :payer_email, :last_name, :first_name,
            :payer_id, :address_zip, :address_state, :address_city,
          :address_street, :address_name, :payment_date, :invoice
          ])
        attrs.merge!(:notified_params_as_json => params.to_json)
        new(attrs)
      end

      private
      def params_to_attrs(params, syms)
        HashWithIndifferentAccess[syms.map {|attr_sym| [attr_sym, params[attr_sym]]}]
      end

    end
  end
end
