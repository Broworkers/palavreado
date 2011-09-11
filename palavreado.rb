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
end

get '/:word' do |word|
  @word = Words[word]

  if @word
    slim :index
  else
    404
  end
end
