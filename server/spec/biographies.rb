# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography do
    one_line_bio "MyString"
    approach "MyText"
    expertise "MyText"
    experience "MyText"
    achievements "MyText"
    value_statement "MyText"
  end
end
