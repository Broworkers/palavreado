# encoding: utf-8

require 'sinatra'
require 'haml'
require 'yaml'
require 'uri'

disable :session

Words = YAML.load_file('words.yml')

helpers do
  def word; params[:word]; end
  def syllables; @word['syllables']; end
  def description; @word['description']; end
  def stress?(i); @word['stress'] == i; end
  def examples; @word['examples']; end
  def last?(i); @word['syllables'].size - 1 == i; end
  def random; Words.keys.shuffle.first(8); end
  def escape(string); (URI.escape(string)); end
end

get '/' do
  redirect to(escape(Words.keys.last))
end

get '/rss' do
  params[:word] = Words.keys.last
  @word = Words[word]

  content_type "application/rss+xml"
  haml :feed, layout: false
end

get '/about' do
  haml :about
end

get '/random' do
  params[:word] = random.first
  @word = Words[word]
  haml :word
end

get '/:word' do |word|
  @word = Words[word]

  if @word
    haml :word
  else
    [404, "Palavra não cadastrada"]
  end
end
