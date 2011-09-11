# encoding: utf-8

require 'sinatra'
require 'slim'
require 'yaml'

Words = YAML.load_file('words.yml')

helpers do
  def word; params[:word]; end
  def syllabes; @word['syllabes']; end
  def description; @word['description']; end
  def stress?(i); @word['stress'] == i; end
  def examples; @word['examples']; end
  def last?(i); @word['syllabes'].size - 1 == i; end
end

get '/:word' do |word|
  @word = Words[word]

  if @word
    slim :index
  else
    [404, "Palavra não cadastrada"]
  end
end
