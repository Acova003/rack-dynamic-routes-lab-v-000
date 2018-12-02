class Application
  
  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      item_price = req.path.split("/items/").last
      item = @@items.find {|i| i.price == item_price}
      resp.write "You requested the items"
      resp.write item.name
      
    # elsif !@@items.include?(item)
    #   resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
    #binding.pry
    resp.finish
  end
end