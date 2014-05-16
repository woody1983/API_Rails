class CreatingEpisodesTest < ActionDispatch::IntegrationTest
  test 'creates episodes' do
    post '/episodes',{episode: {title: 'Bananas',description: 'Learn about bananas.'}}.to_json,
                     {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    episode = json(response.body)
    assert_equal episode_url(episode[:id]),response.location
  end

  test 'does not create episodes with title nil' do
    post '/episodes',{episode: {title: nil, description: 'Learn about bananas.'}}.to_json,
                     {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

end
