require 'sinatra'
require 'slim'

get '/:word' do |word|
  slim :index, locals: { word: word }
end
