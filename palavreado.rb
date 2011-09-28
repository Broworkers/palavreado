# encoding: utf-8

require 'sinatra'
require 'slim'
require 'yaml'
require 'uri'

disable :session

Words = YAML.load_file('words.yml')

helpers do
  def word; params[:word]; end
  def syllabes; @word['syllabes']; end
  def description; @word['description']; end
  def stress?(i); @word['stress'] == i; end
  def examples; @word['examples']; end
  def last?(i); @word['syllabes'].size - 1 == i; end
  def random; Words.keys.shuffle.first(10); end
  def escape(string); (URI.escape(string)); end
end

get '/' do
  redirect to(escape(Words.keys.last))
end

get '/rss' do
  params[:word] = Words.keys.last
  @word = Words[word]
  slim :feed, layout: false
end

get '/about' do
  slim :about
end

get '/random' do
  params[:word] = random.first
  @word = Words[word]
  slim :word
end

get '/:word' do |word|
  @word = Words[word]

  if @word
    slim :word
  else
    [404, "Palavra não cadastrada"]
  end
end
