# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dietary do
    requirements { ['Gluten free','Hindu ','Kosher ','Vegan ','Vegetarian ','Jain','Paleo','None', 'Bland'].sample(3) }
    likes { ['Asparagus', 'Avocados', 'Beets', 'Bell peppers', 'Broccoli', 'Brussels sprouts', 'Cabbage', 'Carrots', 'Cauliflower', 'Celery', 'Collard greens', 'Cucumbers', 'Eggplant', 'Fennel', 'Garlic', 'Green beans', 'Green peas', 'Kale', 'Leeks', 'Mushrooms, crimini', 'Mushrooms, shiitake', 'Mustard greens', 'Olives', 'Onions', 'Potatoes', 'Romaine lettuce', 'Sea vegetables', 'Spinach', 'Squash, summer', 'Squash, winter', 'Sweet potatoes', 'Swiss chard', 'Tomatoes', 'Turnip greens', 'Yams'].sample(4) }
    dislikes { ['Almonds','Cashews','Flaxseeds','Olive oil', 'extra virgin','Peanuts','Pumpkin seeds','Sesame seeds','Sunflower seeds','Walnuts'].sample(4) }
  end
end
