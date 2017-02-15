class Employee
  attr_accessor :id, :full_name, :email, :birthdate, :addresses

  def initialize(hash) 
    @id = hash['id']
    @full_name = hash['full_name']
    @email = hash['email']
    @birthdate = hash['birthdate']
    @addresses = hash['addresses']
  end

  def friendly_birthdate
    birthdate = Date.parse(@birthdate)
    birthdate.strftime('%b %d, %Y')
  end

  def self.find(id)
    employee_hash = Unirest.get("http://localhost:3000/api/v1/employees/#{id}").body 
    Employee.new(employee_hash)
  end  

end    