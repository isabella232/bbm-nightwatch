class ApplicationJob < ActiveJob::Base
  include Rails.application.routes.url_helpers

  protected
  def default_url_options
    { host: ENV['HOST'] }
  end
end
