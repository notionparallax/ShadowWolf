# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    fun { "http://api.randomuser.me/0.2/portraits/#{%w(men women).sample}/#{(0..59).to_a.sample}.jpg" }
    bw { "http://api.randomuser.me/0.2/portraits/#{%w(men women).sample}/#{(0..59).to_a.sample}.jpg" }
    colour { "http://api.randomuser.me/0.2/portraits/#{%w(men women).sample}/#{(0..59).to_a.sample}.jpg" }
  end
end
