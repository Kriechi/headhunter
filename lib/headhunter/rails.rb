require 'headhunter'
require 'headhunter/rack/capturing_middleware'

class Headhunter
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "headhunter.hijack" do |app|
        root = ::Rails.root

        hh = Headhunter.new

        at_exit do
          hh.prepare_results_html
          hh.report
        end

        app.middleware.insert(0, Headhunter::Rack::CapturingMiddleware, hh)
      end
    end
  end
end
