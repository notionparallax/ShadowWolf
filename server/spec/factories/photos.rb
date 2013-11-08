# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    fun { 'http://api.randomuser.me/0.2/portraits/' + ['women','men'].sample + '/' + (1..60).to_a.sample.to_s + '.jpg' }
    bw { 'http://api.randomuser.me/0.2/portraits/' + ['women','men'].sample + '/' + (1..60).to_a.sample.to_s + '.jpg' }
    colour { 'http://api.randomuser.me/0.2/portraits/' + ['women','men'].sample + '/' + (1..60).to_a.sample.to_s + '.jpg' }
  end
end
