require 'warden'
require 'bcrypt'

module Warden
  module Password
    class Strategy < Warden::Strategies::Base
      def valid?
        params[:username] || params[:password]
      end

      def authenticate!
        rubyist = Rubyist.find_by_username(params[:username])

        if rubyist && rubyist.crypted_password == params[:password]
          success! rubyist
        else
          fail! 'Username or Password incorrect'
        end
      end
    end

    module Model
      def self.included(base)
        base.class_eval do
          attr_reader :password
          validates_confirmation_of :password
          validates_presence_of :password, :if => :crypted_password_changed?
        end
      end

      def password=(password)
        self.crypted_password = BCrypt::Password.create(password)
        @password = password
      end

      def crypted_password
        pass = read_attribute(:crypted_password) and BCrypt::Password.new(pass)
      end

      def use_password?
        !!crypted_password
      end
    end
  end
end

Warden::Strategies.add :password, Warden::Password::Strategy
