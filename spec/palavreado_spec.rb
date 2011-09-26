require './palavreado.rb'
require 'bacon'
require 'rack/test'

set :environment, :test

Words = YAML.load_file('spec/words.yml')

describe 'Palavreado.com' do
  extend Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should redirect to an word at /" do
    get '/'
    last_response.should.be.redirect
  end

  it "should return OK for words in dictionary" do
    get '/foobar'
    last_response.should.be.ok
  end

  it "should return 404 for words not in dictionary" do
    get '/gazonk'
    last_response.should.be.not_found
  end
end
