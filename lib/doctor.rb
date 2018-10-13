require "pry"
class Doctor

# - A doctor should be initialized with a name
#  and be saved in the `@@all` array.
  attr_accessor :name
    @@all = []

    def self.all
      @@all
    end

  def initialize(name)
      @name = name
      @@all << self
  end

# The `Doctor` class needs an instance method,
# `#new_appointment`, that takes in an instance of
# the `Patient` class and a date, and creates a
# new appointment. That appointment should know
# that it belongs to the doctor

  def new_appointment(patient, date)
     Appointment.new(patient, self, date)
  end

# The `Doctor` class needs an instance method,
#  `#appointments`, that iterates through all
#  appointments and finds those belonging
#  to this doctor.

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end
def patients
   appointments.collect {|appointment| appointment.patient}
end
end
