class Patient
  attr_reader(:name, :doctor_id, :birthday)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @doctor_id = attributes.fetch(:doctor_id)
    @birthday = attributes.fetch(:birthday)
  end

  define_method(:all_from_doctor) do |id|
    patients = []
    all_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = id;")
    all_patients.each() do |patient|
      name = patient.fetch('name')
      doctor_id = patient.fetch('doctor_id')
      birthday = patient.fetch('birthday')
    patients.push(Patient.new({:name => name, :doctor_id => doctor_id, :birthday => birthday}))
    end
    patients
  end

  define_method(:save) do
    DB.exec("INSERT INTO patients (name, doctor_id, birthday) VALUES ('#{@name}', #{@doctor_id}, '#{@birthday}');")
  end
  define_method(:==) do |another_patient|
    self.name().==(another_patient.name()).&(self.doctor_id.==(another_patient.doctor_id()))
  end
end
