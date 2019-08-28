json.array! @responses do |response|
  json.extract! response, :url, :alert_url, :alert_key, :alert
end

# Il va falloir faire un map
# output => [{ id: 'toto', alert: true }, { ... }]
