json.array! @responses do |response|
  json.extract! response, :id, :alert
end

# Il va falloir faire un map
# output => [{ id: 'toto', alert: true }, { ... }]
