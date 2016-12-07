require('spec_helper')

describe(Doctor) do
  describe(".all") do
    it("starts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("tells you the doctors name") do
      doctor = Doctor.new({:name => "Sanjay Pupta", :id => nil, :specialty => 'proctologist'})
      expect(doctor.name()).to(eq('Sanjay Pupta'))
    end
  end

  describe("#id") do
    it("sets the doctor's ID when you save it") do
      doctor = Doctor.new({:name => "Sanjay Pupta", :id => nil, :specialty => 'proctologist'})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save doctors to the database") do
      doctor = Doctor.new({:name => "Dr. Phil", :id => nil, :specialty => 'therapist'})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#==") do
    it("is the same doctor if it has the same name") do
      doctor1 = Doctor.new({:name => "Doctor Who", :id => nil, :specialty => 'scientist'})
      doctor2 = Doctor.new({:name => "Doctor Who", :id => nil, :specialty => 'scientist'})
      expect(doctor1).to(eq((doctor2)))
    end
  end

  describe("#patients") do
    it("returns an array of patients for that doctor") do
      test_doctor = Doctor.new({:name => "Dr. Seuss", :id => nil, :specialty => 'cartoonist'})
      test_doctor.save()
      test_patient = Patient.new({:name => "Frank Ocean", :doctor_id => test_doctor.id(), :birthday => '12-13-1993'})
      test_patient.save()
      test_patient2 = Patient.new({:name => "Fred Meyer", :doctor_id => test_doctor.id(), :birthday => '12-13-1993'})
      test_patient2.save()
      expect(test_doctor.patients()).to(eq([test_patient, test_patient2]))
    end
  end
end
