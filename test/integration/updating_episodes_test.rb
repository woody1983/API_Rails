class UpdatingEpisodesTest < ActionDispatch::IntegrationTest
  setup { @episode = Episode.create!(title: 'First Title') }

  test 'successful update' do 
    patch "/episodes/#{@episode.id}",
      { episode: {title: 'First Title Edit'}} .to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 200, response.status
    assert_equal 'First Title Edit',@episode.reload.title
  end

  test 'unsuccessful update on short title' do 
    patch "/episodes/#{@episode.id}",
      {episode: {title: 'short'}}.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

end
