class Integrant
  include ActiveModel::Model

  attr_accessor :name, :last_name, :description, :team 
  attr_accessor :file_name

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def self.back_team
    integrants = []

    integrants
  end

  def self.front_team
    integrants = []

    integrants << Integrant.new({name:"José Tomás",last_name:"Codecido",description:"Fullstack G13",file_name:"jsc_front.png"})

    integrants
  end
  
  def self.streaming_team
    integrants = []

    integrants
  end

  def instance_method
    "Soy un método de instancia"
  end

  def self.class_method
    "Soy un método de clase"
  end  
end