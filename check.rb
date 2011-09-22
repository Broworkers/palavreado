# encoding: utf-8
require 'yaml'

def verify(value, klass=String)
  raise unless klass === value
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

    values['syllabes'].tap do |syllabes|
      verify syllabes, Array
      syllabes.each {|syllabe| verify syllabe }
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
  err.puts "Palavra '#$key' inválida"
  exit 1
else
  out.puts "OK"
  exit 0
end
