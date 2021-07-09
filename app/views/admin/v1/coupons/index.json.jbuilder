json.coupons do
  json.array! @loading_service.records, :id, :code
end