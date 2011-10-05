# encoding: utf-8
require 'yaml'

def verify(value, klass=String)
  raise "Palavra '#$key' inválida" unless klass === value
end

out = STDOUT
err = STDERR
file = ARGV.first

out.print "Analisando #{file}... "
begin
  Words = YAML.load_file(file)

  Words.each do |key, values|
    $key = key

    verify key

    values['syllables'].tap do |syllables|
      verify syllables, Array
      syllables.each {|syllable| verify syllable }
    end

    verify values['stress'], Integer
    verify values['description']

    values['examples'].tap do |examples|
      verify examples, Array
      examples.each {|example| verify example}
    end
  end
rescue => ex
  out.puts "ERRO"
  err.puts ex.message
  exit 1
else
  out.puts "OK"
  exit 0
end
