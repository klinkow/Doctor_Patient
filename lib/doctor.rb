class Doctor
 attr_reader(:name, :id, :specialty)

 define_method(:initialize) do |attributes|
   @name = attributes.fetch(:name)
   @id = attributes.fetch(:id)
   @specialty = attributes.fetch(:specialty)
 end

 define_singleton_method(:all) do
  returned_doctors = DB.exec("SELECT * FROM doctors;")
  doctors = []
  returned_doctors.each() do |doctor|
    name = doctor.fetch('name')
    id = doctor.fetch('id').to_i()
    specialty = doctor.fetch('specialty')
    doctors.push(Doctor.new({:name => name, :id => id, :specialty => specialty}))
  end
  doctors
end
  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def ==(another_doctor)
      name().==(another_doctor.name()).&(self.id().==(another_doctor.id()))
    end

    define_method(:patients) do
     doctor_patients = []
     patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
     patients.each() do |patient|
       name = patient.fetch("name")
       doctor_id = patient.fetch("doctor_id").to_i()
       birthday = patient.fetch('birthday')
       doctor_patients.push(Patient.new({:name => name, :doctor_id => doctor_id, :birthday => birthday}))
     end
     doctor_patients
   end


end
