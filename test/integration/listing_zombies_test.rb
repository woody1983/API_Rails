require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.rails-dev.com'}

  test 'returns list of all zombies' do
    get '/zombies'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns zombies filtered by bio' do
    John = Zombie.create!(name: 'John',bio: 'axe')
    Joanna = Zombie.create!(name: 'Joanna', bio: 'shotgun')

    get '/zombies?bio=axe'
    assert_equal 200, response.status

    zombies = JSON.parse(response.body, symbolize_names: true)
    names = zombies.collect {|z| z[:name]}
    assert_includes names, 'John'
    refute_includes names, 'Joanna'
  end

  test 'returns zombie by id' do
    zombie = Zombie.create!(name: 'Joanna', bio: 'shotgun')
    get "/zombies/#{zombie.id}"
    assert_equal 200, response.status

    zombie_response = json(response.body)#JSON.parse(response.body, symbolize_names: true)
    assert_equal zombie.name, zombie_response[:name]
  end

end
