class Integrant
  include ActiveModel::Model

  attr_accessor :name, :last_name, :description, :team 
  attr_accessor :path

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def self.back_team
    integrants = []

    integrants
  end

  def self.front_team
    integrants = []
    base_path = 
    integrants << Integrant.new({name:"José Tomás",last_name:"Codecido",description:"Fullstack G13", path: Rails.root.join('public','integrants','front','jsc_front.png') })

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