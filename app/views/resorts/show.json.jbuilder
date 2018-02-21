json.partial! "resorts/resort", resort: @resort
json.trails do
  json.array! @resort.trails, partial: 'trails/trail', as: :trail
end