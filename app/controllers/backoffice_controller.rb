class BackofficeController < ApplicationController
  before_action :authenticate_user!, :set_page_title, :set_default_notice_kind
  
  layout "backoffice"

  private
    def set_page_title
      @model = self.controller_name.camelize
    end

    def set_default_notice_kind
      @notice_kind = "info"
    end
end
