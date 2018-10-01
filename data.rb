require_relative('./models/customers.rb')
require_relative('./models/films.rb')
require_relative('./models/tickets.rb')

def clear_db()
  Ticket.delete_all()
  Customer.delete_all()
  Film.delete_all()
end

def create_data()
  customer1 = Customer.new({'name'=>'Lucy Bagshot','funds'=>'45'})
  customer2 = Customer.new({'name'=>'Graeme Laundry','funds'=>'34'})
  customer3 = Customer.new({'name'=>'Phillip Handbag','funds'=>'23'})
  customer4 = Customer.new({'name'=>'Sharon Walls','funds'=>'64'})
  customer5 = Customer.new({'name'=>'Barry Peas','funds'=>'84'})
  customer6 = Customer.new({'name'=>'Philomena Cunk','funds'=>'39'})
  customer7 = Customer.new({'name'=>'Garrry Toomany-Rs','funds'=>'25'})
  customer8 = Customer.new({'name'=>'Bob Holster','funds'=>'51'})
  customer9 = Customer.new({'name'=>'Manfred Wolfparts','funds'=>'22'})

  customer1.save()
  customer2.save()
  customer3.save()
  customer4.save()
  customer5.save()
  customer6.save()
  customer7.save()
  customer8.save()
  customer9.save()

  film1 = Film.new({'title'=>'Gone with the Beans','price'=>'6','showings'=>['0900','1200','1450','1600','1930'],'tickets'=>100})
  film2 = Film.new({'title'=>'Babe: Pigs in blankets','price'=>'7','showings'=>['1120','1345','1600'],'tickets'=>45})
  film3 = Film.new({'title'=>'The Texas Chainstore Massacre','price'=>'10','showings'=>['1000','1130','1350','1425','1630','2200'],'tickets'=>20})
  film4 = Film.new({'title'=>'Transformers 67','price'=>'15','showings'=>['1100','1300','1900'],'tickets'=>110})
  film5 = Film.new({'title'=>'Spiderthing: Homework','price'=>'8','showings'=>['0930','1030','1230','1400','1450','1600','1800','2030'],'tickets'=>50})

  film1.save()
  film2.save()
  film3.save()
  film4.save()
  film5.save()

  ticket1 = Ticket.new({'customer_id'=>customer3.id,'film_id'=>film1.id})
  ticket2 = Ticket.new({'customer_id'=>customer2.id,'film_id'=>film3.id})
  ticket3 = Ticket.new({'customer_id'=>customer7.id,'film_id'=>film5.id})
  ticket4 = Ticket.new({'customer_id'=>customer1.id,'film_id'=>film2.id})
  ticket5 = Ticket.new({'customer_id'=>customer1.id,'film_id'=>film1.id})
  ticket6 = Ticket.new({'customer_id'=>customer8.id,'film_id'=>film1.id})
  ticket7 = Ticket.new({'customer_id'=>customer7.id,'film_id'=>film2.id})
  ticket8 = Ticket.new({'customer_id'=>customer4.id,'film_id'=>film5.id})
  ticket9 = Ticket.new({'customer_id'=>customer9.id,'film_id'=>film2.id})
  ticket10 = Ticket.new({'customer_id'=>customer5.id,'film_id'=>film5.id})

  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()
  ticket6.save()
  ticket7.save()
  ticket8.save()
  ticket9.save()
  ticket10.save()
end
