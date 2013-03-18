require "json"
require "open-uri"

# this file is responsible for talking with the file

class HtmlGenerator

  def show(id)
    print_header
    product = retreive_show_data("http://lcboapi.com/products/#{id}.json")
    display_detailed_product(product)
    print_footer
  end

  def index
    print_header
    puts "<h1>All Products</h1>"
    products = retreive_data

    products.each do |product|
      display_product(product)
  end

    print_footer
  end

  private 

  def display_detailed_product(product)
    puts "<h2>#{product['name']}</h2>"
    puts "<div style=float:left><img src=#{product['image_url']}></div>"
    puts "<div class='info'><ul style='list-style: none;'><li>id: #{product['id']}</li>"
    puts "<li>#{product['producer_name']}</li>"
    puts "<li>#{product['primary_category']}</li>"
    puts "<li>#{product['secondary_category']}</li>" 
    puts "<li>#{product['origin']}</li>"
    puts "<li>#{product['package_unit_volume_in_milliliters']} ml</li>"
    puts "<li>#{product['package']}</li>"
    puts "<li>$#{product['price_in_cents'].to_f/100}</li>"
    puts "<li>#{product['serving_suggestion']}</li>"
    puts "<li>#{product['tasting_note']}</li>"
    puts "<li>Tags: #{product['tags']}</li></ul></div>"
    puts "<div style=clear:both></div>"

  end
  
  def display_product(product)
    puts "<h2>#{product['name']}</h2>"
    puts "<div style=float:left><img src=#{product['image_thumb_url']}></div>"
    puts "<div class='info'><ul style='list-style: none;'><li>id: #{product['id']}</li>"
    puts "<li>#{product['producer_name']}</li>"
    puts "<li>#{product['primary_category']}</li>"
    puts "<li>#{product['secondary_category']}</li>" 
    puts "<li>#{product['package_unit_volume_in_milliliters']} ml</li>"
    puts "<li>$#{product['price_in_cents'].to_f/100}</li></ul></div>"
    puts "<div style=clear:both></div>"
  end

  def print_header
    puts "<html>"  
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
  end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  def retreive_data
    response = open("http://lcboapi.com/products.json").read # usually you will not be specifying the filetype.
    data = JSON.parse(response)
    return data["result"]
  end

  def retreive_show_data(url)
    response = open(url).read # usually you will not be specifying the filetype.
    data = JSON.parse(response)
    return data["result"]
  end


end