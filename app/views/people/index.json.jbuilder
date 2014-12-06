json.array!(@people) do |person|
  json.extract! person, :id, :unit_id, :nickname, :accesslevel, :name, :surname, :email, :telefone, :password_digest, :active, :note
  json.url person_url(person, format: :json)
end
