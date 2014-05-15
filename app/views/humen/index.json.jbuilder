json.array!(@humen) do |human|
  json.extract! human, :id, :name, :desc
  json.url human_url(human, format: :json)
  json.message I18n.t('human_message', name: human.name)
end
