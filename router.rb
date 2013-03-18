require_relative 'html_generator'
# or, require './html_generator'

# Access Paramters passed into the app

# puts ARGV[0].inspect              # argument vector. anything in ruby has access to ARGV. you can type "ruby router.rb 1 2 3 4" in Terminal and get "1 2 3" back.
# puts ARGV[1].inspect
# puts ARGV[2].inspect          

if ARGV.empty?                      # there are no arugments provided
  puts "USAGE: bla bla bla"
else
  # puts "ya, you passed in some arguments. :)"
  generator = HtmlGenerator.new
  if ARGV[0] == "index"
    generator.index  
  elsif ARGV[0] == "show"
      id = ARGV[1]
      generator.show(id)
  else 
    puts "Unrecognized action. Please refer to USAGE."
  end

end

