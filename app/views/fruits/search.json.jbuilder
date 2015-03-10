json.array!(@fruits) do |fruit|
  json.extract! fruit, :id, :species, :organic
  json.url fruit_url(fruit, format: :json)
end
