if Meet.exists?(:employee_name => "Jeff Arms")
else Meet.create!(employee_name: "Jeff Arms", headshot: "", duration: nil, about: "", position: "")
end

if Meet.exists?(:employee_name => "Bill Smith")
else Meet.create!(employee_name: "Bill Smith", headshot: "", duration: nil, about: "", position: "")
end

if Meet.exists?(:employee_name => "Denice Gudah")
else Meet.create!(employee_name: "Denice Gudah", headshot: "", duration: nil, about: "", position: "")
end

if Meet.exists?(:employee_name => "Nikki Paliga")
else Meet.create!(employee_name: "Nikki Paliga", headshot: "", duration: nil, about: "", position: "")
end

if Meet.exists?(:employee_name => "Brad Bosker")
else Meet.create!(employee_name: "Brad Bosker", headshot: "", duration: nil, about: "", position: "")
end
