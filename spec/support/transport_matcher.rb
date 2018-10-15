require 'rspec/expectations'

RSpec::Matchers.define :transport_matcher do |expected_transport|
  match do |actual_transport|
    actual_transport.name == expected_transport.name &&
    actual_transport.phone == expected_transport.phone &&
    actual_transport.email == expected_transport.email &&
    actual_transport.donation.id == expected_transport.donation.id &&
    actual_transport.transporter.id == expected_transport.transporter.id
  end
end
