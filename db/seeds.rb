require 'faker'
# =========================================================================================
# Distributor seed
# =========================================================================================
user = Erp::User.first

Erp::Distributors::Distributor.destroy_all

vietname = Erp::Areas::Country.first.id
states = Erp::Areas::State.all.limit(11)
districts = Erp::Areas::District.first

states.each do |state|
  Erp::Distributors::Distributor.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    open_time: '10h',
    image: nil,
    phone: Faker::PhoneNumber.cell_phone,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    creator_id: user.id,
    country_id: nil,
    state_id: state.id,
    district_id: state.districts.first.id
  )
end