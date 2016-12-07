require('spec_helper')

describe(Patient) do


  describe("#save") do
    it("adds a patient to the array of saved patients") do
      test_patient = Patient.new({:name => "Murphy Brown", :doctor_id => 1, :birthday => '04-07-2016'})
      test_patient.save()
      expect(Patient.all_from_doctor(1)).to(eq([test_patient]))
    end
  end

  describe("#all_from_doctor") do
    it("returns an array of all of the patients from a particular doctor") do
      test_patient = Patient.new({:name => "Murphy Brown", :doctor_id => 1, :birthday => '04-07-2016'})
      test_patient.save()
      expect(test_patient.all_from_doctor(1)).to(eq([test_patient]))
    end
  end

  describe("#name") do
    it("gives you the patient name") do
      test_patient = Patient.new({:name => "Kanye West", :doctor_id => 1, :birthday => '12-04-2016'})
      expect(test_patient.name()).to(eq("Kanye West"))
    end
  end

  describe("#doctor_id") do
    it("lets you read the list ID out") do
      test_patient = Patient.new({:name => "Forrest Gump", :doctor_id => 1, :birthday => '05-06-1961'})
      expect(test_patient.doctor_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same patient if it has the same name and doctor ID") do
      patient1 = Patient.new({:name => "Charlie Brown", :doctor_id => 1, :birthday => '02-23-1932'})
      patient2 = Patient.new({:name => "Charlie Brown", :doctor_id => 1, :birthday => '02-23-1932'})
      expect(patient1).to(eq(patient2))
    end
  end
end
