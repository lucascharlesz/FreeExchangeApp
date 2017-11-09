class BackofficeController < ApplicationController
  before_action :authenticate_user!, :set_page_title
  
  layout "backoffice"

  private
    def set_page_title
      @model = self.controller_name.camelize
    end
end
