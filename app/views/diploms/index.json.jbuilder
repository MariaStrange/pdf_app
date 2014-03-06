json.array!(@diploms) do |diplom|
  json.extract! diplom, :id, :name, :amount
  json.url diplom_url(diplom, format: :json)
end
