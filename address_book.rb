class AddressBook
  attr_accessor :contacts
  def initialize(contacts)
    @contacts = contacts
  end
  def printContacts
    @contacts.map {|c| c.formatContact}
  end
end

class Contact
  attr_accessor :name,:tel
  def initialize(name,tel)
    @name = name
    @tel = tel
  end
  def formatContact
    "name: #{name}, tel: #{tel}"
  end
end

chris = Contact.new('Chris',"07809671734")
ben = Contact.new('Ben',"07809671734")
dan = Contact.new('Dan',"07809671734")
amy = Contact.new('Amy',"07809671734")
book = AddressBook.new([chris,ben])
puts book.printContacts
