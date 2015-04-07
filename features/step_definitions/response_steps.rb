# encoding: UTF-8
Transform /^(-?\d+)$/ do |number|
  number.to_i
end

Then(/^the LRS responds with HTTP \[(\d+)\]$/) do |http|
  expect(last_response.status).to eq(http)
end

Then(/^the LRS responds with HTTP (\d+)$/) do |arg1|
  expect(last_response.status).to eq(http)
end
