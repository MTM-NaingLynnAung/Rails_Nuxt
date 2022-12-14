# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Manufacture.count == 0
  path = File.join(File.dirname(__FILE__), "./seeds/car.json")
  records = JSON.parse(File.read(path))
  records.each do |record|
    record[1].each do |data|
      manufacture = Manufacture.create!(name: data["name"])
      data["car_models"].each do |model|
        manufacture.car_models.create!(name: model['name'])
      end
    end
  end
  puts "----------------Manufacture are seeded"
end


BuildType.create(name: 'Sedan')
BuildType.create(name: 'Hatchback')
BuildType.create(name: 'Sports')
BuildType.create(name: 'SUV')
BuildType.create(name: 'Light Truck')
BuildType.create(name: 'MPV (minivan)')
BuildType.create(name: 'Mini Bus')
BuildType.create(name: 'Mini Truck')
BuildType.create(name: 'Pick up Truck')
BuildType.create(name: 'Stationwagon')
BuildType.create(name: 'Hatchback')

# Manufacture.create(name: 'Audi')
# Manufacture.create(name: 'BMW')
# Manufacture.create(name: 'Ford')
# Manufacture.create(name: 'Kia')

# CarModel.create(manufacture_id: 1, name: 'A8')
# CarModel.create(manufacture_id: 1, name: 'Coupe')
# CarModel.create(manufacture_id: 1, name: 'Q8')
# CarModel.create(manufacture_id: 1, name: 'R8')
# CarModel.create(manufacture_id: 1, name: 'RS4')

# CarModel.create(manufacture_id: 2, name: 'M5')
# CarModel.create(manufacture_id: 2, name: '730i')
# CarModel.create(manufacture_id: 2, name: 'M5 competition')
# CarModel.create(manufacture_id: 2, name: '710i')
# CarModel.create(manufacture_id: 2, name: 'X6')

# CarModel.create(manufacture_id: 3, name: 'F-150')
# CarModel.create(manufacture_id: 3, name: 'Raptor')
# CarModel.create(manufacture_id: 3, name: 'Everest')
# CarModel.create(manufacture_id: 3, name: 'F-350')

# CarModel.create(manufacture_id: 4, name: 'optima')
# CarModel.create(manufacture_id: 4, name: 'sorento')
# CarModel.create(manufacture_id: 4, name: 'captival')
# CarModel.create(manufacture_id: 4, name: 'K9')
