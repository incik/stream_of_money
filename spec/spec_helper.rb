require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'capybara/poltergeist'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.fail_fast = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false

  config.before(:each) do
    # karel bagr - no invoices
    # invoice list
    stub_request(:get, "https://karel%40bagr.cz:heslo@karelbagr.billapp.cz/invoices.xml").
         with(:headers => {'Accept'=>'application/xml', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><nil-classes type=\"array\"/>", headers: {})

    # tomas vaisar - 1 invoice
    # invoice list
    stub_request(:get, "https://tomas%40vaisar.cz:heslo@tomvaisar.billapp.cz/invoices.xml").
         with(:headers => {'Accept'=>'application/xml', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => '<?xml version="1.0" encoding="UTF-8"?>
<invoices type="array">
    <invoice>
        <account-id type="integer">7104</account-id>
        <client-id type="integer">58547</client-id>
        <created-at type="datetime">2015-04-09T11:08:04+02:00</created-at>
        <currency>CZK</currency>
        <due-date type="date">2015-04-19</due-date>
        <has-vat type="boolean">false</has-vat>
        <id type="integer">99941</id>
        <issue-date type="date">2015-04-09</issue-date>
        <notes></notes>
        <number>201500001</number>
        <paid-on type="date" nil="true"></paid-on>
        <status>sent</status>
        <tax-amount type="decimal">0.0</tax-amount>
        <total-amount type="decimal">30000.0</total-amount>
        <updated-at type="datetime">2015-04-09T11:08:05+02:00</updated-at>
        <lines type="array">
            <line type="InvoiceLine">
                <description>Kupa sena</description>
                <item-id type="integer" nil="true"></item-id>
                <quantity type="decimal">1.0</quantity>
                <unit-price type="decimal">30000.0</unit-price>
                <vat type="decimal">0.0</vat>
            </line>
        </lines>
    </invoice>
</invoices>', :headers => {})
  end

end

Capybara.javascript_driver = :poltergeist

WebMock.disable_net_connect!(allow_localhost: true, allow: 'codeclimate.com')
