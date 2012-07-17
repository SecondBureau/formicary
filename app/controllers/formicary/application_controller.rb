module Formicary
  class ApplicationController < ActionController::Base
    protect_from_forgery :except => [:update, :delete, :create]
  end
end
