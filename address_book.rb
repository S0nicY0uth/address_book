class AddressBook
  attr_accessor :contacts
  def initialize(contacts)
    @contacts = contacts
  end
  def printContacts
    @contacts.map {|c| c.formatContact}
  end
  def getContact(name)
    @contacts.select {|c| c.name == name }
  end
  def printContactsByName(name)
    getContact(name).map{|c| c.formatContact}
  end
  def addNewContact(name,number)
    c = Contact.new(name,number)
    @contacts.push(c)
  end
  def listContactsByIndex
    @contacts.each_with_index{|v,i| puts "#{i} #{v.name}" }
  end
  def delContactByIndex(i)
    @contacts.delete_at(i)
    listContactsByIndex
  end
end

class View
  attr_reader :contacts
  def initialize(addressbook)
    @addressbook = addressbook
  end
  def mainMenu
    run = true
    while run
      puts '1)List All Contacts 2)Search for Contact 3)Add new Contact 4)Delete Contact 5)Quit'
      choice = gets.strip.chomp.to_i
      case choice
      when 1
        puts @addressbook.printContacts
      when 2
        puts 'please enter the name of the contact you wish to search for'
        nm = gets.strip.chomp.to_s
        puts @addressbook.printContactsByName(nm)
      when 3
        puts 'please enter a name for the new contact..'
        name = gets.strip.chomp.to_s
        puts 'please enter a telephone number'
        tel = gets.strip.chomp.to_s
        @addressbook.addNewContact(name,tel)
      when 4
        @addressbook.listContactsByIndex
        puts 'which contact would you like to delete?'
        i = gets.strip.chomp.to_i
        @addressbook.delContactByIndex(i)
      when 5
        run = false
      end
    end
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
book = AddressBook.new([chris,ben,dan,amy])
view = View.new(book)
view.mainMenu
