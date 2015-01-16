json.array!(@storages) do |storage|
  json.extract! storage, :id, :title, :item_id
  json.url storage_url(storage, format: :json)
end
