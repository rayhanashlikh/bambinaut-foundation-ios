//
//  Seeds.swift
//  Bambinout
//
//  Created by MacBook Air on 24/09/24.
//

import Foundation
import SwiftData
import SwiftUI




let seedNutritions = [
    "Vitamin A",
    "Vitamin C",
    "Vitamin D",
    "Vitamin E",
    "Vitamin K",
    "Vitamin B1",
    "Vitamin B2",
    "Vitamin B3",
    "Vitamin B6",
    "Vitamin B12",
    "Folate",
    "Fiber",
    "Potassium",
    "Calcium",
    "Iron",
    "Selenium",
    "Zinc",
    "Omega-3 Fatty Acids",
    "Omega 6",
    "Healthy Fats",
    "Protein",
    "Carbohydrates",
    "Antioxidants",
    "Manganese",
    "Beta-carotene",
    "Collagen"
]

let seedAllergies = [
    "Seafood",
    "Dairy",
    "Nuts",
    "Egg",
    "Gluten",
]

let seedIngredients: [(name: String, minMonths: Int, maxMonths: Int, allergen: String?, nutritions: [String], weightSuitability: Int, description: String)] = [
    ("Carrot", 6, 8, nil, ["Vitamin A", "Fiber", "Potassium"], 0, "Carrots are crunchy root vegetables rich in beta-carotene and fiber, making them an excellent choice for baby’s nutrition. To prepare, wash and peel the carrots, then cut them into small pieces. Steam or boil until they are tender and easy to mash. For younger babies, you can blend the cooked carrots into a smooth puree, adding a little water or breast milk to achieve the desired consistency. This tasty vegetable introduces sweetness and vibrant color to your baby's meals."),
    
    ("Peas", 6, 8, nil, ["Vitamin K", "Protein", "Fiber"], 0, "Sweet green peas are nutrient-dense and a delightful first food for babies. They are rich in vitamins and have a naturally sweet flavor. To prepare, simply shell the peas and cook them in boiling water until tender, about 3-5 minutes. Once cooked, mash them with a fork for a chunkier texture or blend them into a smooth puree. Peas can also be mixed with other pureed vegetables or fruits for added flavor and nutrition."),
    
    ("Banana", 6, 8, nil, ["Potassium", "Vitamin C", "Fiber"], -1, "Bananas are soft, sweet fruits known for their high potassium content, making them perfect for baby's first foods. They are very easy to prepare: simply peel the banana and mash it with a fork until smooth. For younger babies, you can blend it to a puree. Bananas are naturally creamy and can be mixed with other fruits or cereals for added taste, making them a versatile choice in your weaning journey."),
    
    ("Avocado", 6, 8, nil, ["Healthy Fats", "Vitamin E", "Fiber"], 1, "Avocados are creamy fruits full of healthy fats and nutrients, vital for your baby's growth and brain development. To prepare, cut the avocado in half, remove the pit, and scoop out the flesh. Mash it with a fork or blend it until smooth. Its rich, buttery texture makes it an excellent standalone food, but you can also mix it with other purees to introduce new flavors while keeping the creamy consistency."),
    
    ("Apples (cooked)", 6, 8, nil, ["Vitamin C", "Fiber"], 0, "Cooked apples are a soft, sweet, and nutritious choice for babies starting on solids. To prepare, peel, core, and slice the apples, then steam or boil them until they are tender. Once cooked, mash them or blend into a smooth puree. Cooked apples can be served alone or mixed with spices like cinnamon for added flavor. This method retains their sweetness and provides a comforting, familiar taste for little ones."),
    
    ("Oatmeal", 6, 8, "Gluten", ["Fiber", "Iron", "Protein"], -1, "Oatmeal is a warm, hearty grain that is perfect for breakfast. It is filling and packed with nutrients. To prepare, cook rolled oats in water or breast milk until they are soft and creamy, which usually takes about 5-10 minutes. You can blend the cooked oatmeal to achieve a smoother texture or leave it a bit chunky, depending on your baby's preference. Adding mashed fruits like bananas or apples enhances the flavor and nutritional value."),
    
    ("Zucchini", 6, 8, nil, ["Vitamin C", "Potassium", "Fiber"], 0, "Zucchini is a versatile squash that can be easily introduced into your baby's diet. It has a mild flavor that pairs well with various other foods. To prepare, wash and peel the zucchini, then chop it into small pieces. Steam or boil until tender, about 5-7 minutes, then blend or mash to the desired consistency. You can mix it with other purees or serve it plain to help your baby explore different tastes."),
    
    ("Pumpkin", 6, 8, nil, ["Vitamin A", "Fiber", "Potassium"], 0, "Pumpkin is a sweet and nutritious squash rich in vitamins. To prepare, peel and chop the pumpkin into small chunks, then steam or roast until soft, which usually takes about 20 minutes. After cooking, blend the pumpkin into a smooth puree, which can be served alone or mixed with other fruits for a delicious combination. Its natural sweetness and vibrant color make it a favorite among babies."),
    
    ("Chicken (pureed)", 8, 10, nil, ["Protein", "Iron", "Zinc"], 0, "Pureed chicken is an excellent source of protein and essential minerals for growing babies. To prepare, cook chicken thoroughly by boiling or baking until no longer pink inside. Once cooked, cut into pieces and blend with a bit of broth or water until smooth. This puree can be mixed with vegetables for added nutrients and flavor, providing a balanced meal option as your baby progresses in their weaning journey."),
    
    ("Pear (cooked)", 8, 10, nil, ["Vitamin C", "Fiber"], 0, "Soft, sweet cooked pears are easy to digest and perfect for introducing new flavors. To prepare, peel, core, and chop the pears, then steam or boil until tender. Once cooked, mash them or blend into a smooth puree. Pears can be served alone or combined with other fruits like apples for a delightful mix. Their natural sweetness and smooth texture make them a great addition to your baby's diet."),
    
    ("Broccoli (cooked)", 8, 10, nil, ["Vitamin C", "Fiber", "Calcium"], 0, "Broccoli is a nutrient-dense vegetable that offers many health benefits for babies. To prepare, wash and cut the broccoli into small florets, then steam until soft, about 5-7 minutes. Once cooked, blend into a smooth puree or mash for a chunkier texture. Mixing broccoli with other pureed vegetables can enhance flavor while ensuring your baby receives essential vitamins and minerals."),
    
    ("Mango (pureed)", 8, 10, nil, ["Vitamin A", "Vitamin C", "Fiber"], 0, "Mango is a sweet tropical fruit rich in vitamins, making it an excellent choice for baby's weaning food. To prepare, peel and pit the mango, then chop it into small pieces. Blend the mango until smooth, or mash it for a slightly chunkier consistency. Its vibrant color and natural sweetness make it appealing to babies, and it can be mixed with other fruits or yogurt for a nutritious snack."),
    
    ("Yogurt (plain, whole milk)", 10, 12, "Dairy", ["Calcium", "Protein", "Probiotics"], 1, "Plain whole milk yogurt is creamy, nutritious, and full of probiotics beneficial for digestive health. Serve it directly in small amounts or mix it with pureed fruits for added flavor. Its smooth texture makes it easy for babies to enjoy, and it's a great source of calcium for developing bones. Be sure to choose unsweetened varieties to avoid added sugars."),
    
    ("Beef (pureed)", 10, 12, nil, ["Iron", "Protein", "Zinc"], 1, "Pureed beef is rich in iron and essential vitamins, making it a nutritious choice for growing babies. To prepare, cook the beef thoroughly, either by boiling or baking, until tender. After cooking, cut the beef into small pieces and blend with some broth or water until smooth. This puree can be served alone or mixed with vegetables for a well-rounded meal."),
    
    ("Chickpeas (pureed)", 10, 12, nil, ["Protein", "Fiber", "Iron"], 0, "Chickpeas are a great source of protein and fiber, making them an excellent option for plant-based meals. To prepare, soak dried chickpeas overnight, then cook until soft, which usually takes about 1-2 hours. Once cooked, blend them into a smooth puree, adding a little water or broth as needed for consistency. Chickpeas can be flavored with spices like cumin for added taste and nutrition."),
    
    ("Potatoes", 10, 12, nil, ["Vitamin C", "Potassium", "Fiber"], -1, "Potatoes are soft, starchy tubers that are versatile and filling. To prepare, peel and chop the potatoes into small cubes, then boil or steam until tender, about 15-20 minutes. Once cooked, mash them or blend with a little breast milk or formula for a creamy texture. Potatoes can also be mixed with vegetables for a hearty meal, offering energy and nutrients."),
    
    ("Spinach (cooked)", 10, 12, nil, ["Iron", "Vitamin K", "Fiber"], 0, "Spinach is a leafy green that is rich in iron and vitamins. To prepare, wash and remove any tough stems, then steam the spinach until wilted and tender, which usually takes about 5 minutes. Blend or mash the spinach until smooth, ensuring it's easy for your baby to eat. Spinach can be mixed with other purees or served alone for a nutritious option packed with essential nutrients."),
    
    ("Whole Grain Bread", 10, 12, "Gluten", ["Fiber", "B Vitamins", "Iron"], -1, "Whole grain bread is nutty, wholesome, and filled with fiber. To prepare, lightly toast the bread to make it easier to chew, then blend with a little water or breast milk to create a soft, spreadable consistency. This can be served alone or topped with smooth fruit purees. It offers a great way to introduce grains into your baby’s diet while providing essential nutrients."),
    
    ("Cheese (soft, mild)", 10, 12, "Dairy", ["Calcium", "Protein", "Vitamin A"], 0, "Soft, mild cheese is a great source of calcium and protein for babies. To prepare, cut the cheese into small, manageable pieces or grate it for easier eating. It can be served on its own or melted into other dishes like vegetables or pasta for added flavor. Cheese can also be combined with fruits for a delightful snack, providing both taste and nutrition."),
    
    ("Noodle / Pasta (cooked)", 10, 12, "Gluten", ["Carbohydrates", "B Vitamins", "Iron"], 0, "Soft pasta is a staple in many cuisines and makes a great food for babies. To prepare, cook pasta until very soft, according to package instructions. Once cooked, drain and rinse, then cut into small pieces suitable for little hands. Pasta can be served plain or with a light sauce or blended with vegetables for a nutritious meal that encourages self-feeding."),
    
    ("Watermelon", 8, 10, nil, ["Vitamin C", "Vitamin A"], 0, "Watermelon is a juicy, hydrating fruit that is perfect for hot weather. To prepare, remove the rind and seeds, then cut the watermelon into small, manageable pieces or puree it until smooth. This refreshing fruit can be served as a snack or dessert, providing hydration and natural sweetness for your baby, making it a delightful addition to their diet."),
    
    ("Tuna", 10, 12, "Seafood", ["Protein", "Omega-3 Fatty Acids", "Selenium"], 1, "Tuna is a rich source of protein and omega-3 fatty acids, essential for brain development. To prepare, ensure you use cooked or canned tuna that is low in mercury. Flake the tuna and mix it with a bit of mayonnaise or yogurt for a creamy texture. Serve it as a spread on soft bread or mix with vegetables for a nutritious meal that packs a flavorful punch."),
    
    ("Almond", 10, 12, "Nuts", ["Healthy Fats", "Protein", "Vitamin E"], 1, "Almonds are crunchy nuts rich in healthy fats and vitamins, but they should be introduced with caution. To prepare for babies, ensure almonds are finely ground or made into almond butter to prevent choking. You can mix almond butter with fruits or serve it on toast as a nutrient-dense snack that promotes healthy growth and development."),
    
    ("Eggplant", 8, 10, nil, ["Fiber", "Antioxidants", "Vitamins B1 & B6"], 0, "Eggplant is a versatile vegetable that absorbs flavors well, making it great for baby food. To prepare, wash and slice the eggplant, then steam or roast until soft. Once cooked, blend or mash it to a smooth consistency. Eggplant can be served alone or mixed with other vegetables to introduce new flavors and nutrients to your baby’s meals."),
    
    ("Corn", 6, 8, nil, ["Carbohydrates", "Fiber", "Vitamin C"], 0, "Sweet corn kernels are packed with nutrients and provide a naturally sweet taste. To prepare, cook the corn by steaming or boiling until tender, then blend or mash the kernels to achieve a smooth puree. Corn can also be mixed with other vegetables or served on its own, making it a fun and nutritious addition to your baby's diet."),
    
    ("Tempe", 10, 12, "Nuts", ["Protein", "Fiber", "Iron"], 0, "Tempe is a fermented soy product that is rich in protein and flavor. To prepare, steam or sauté the tempe until heated through, then crumble or mash it. It can be mixed with vegetables or grains for a complete meal, offering a unique flavor and a nutritious option for babies exploring plant-based foods."),
    
    ("Tofu", 8, 10, "Nuts", ["Protein", "Calcium", "Iron"], 0, "Tofu is a soft soy product that is an excellent source of protein and calcium. To prepare, cut the tofu into small cubes and steam or sauté until warm. You can mash it for younger babies or leave it in small pieces for older babies to practice self-feeding. Tofu can be incorporated into various dishes, providing a mild flavor that complements many ingredients."),
    
    ("Pineapple", 6, 8, nil, ["Vitamin C", "Manganese", "Bromelain"], 0, "Pineapple is a tropical fruit known for its sweet, tangy flavor and numerous health benefits. To prepare, peel and core the pineapple, then cut it into small pieces or puree until smooth. It can be served as a standalone snack or mixed with other fruits for a refreshing fruit salad. Pineapple is a delightful way to introduce tropical flavors to your baby's palate."),
    
    ("Chicken Feet", 10, 12, nil, ["Protein", "Collagen"], 0, "Chicken feet are rich in collagen, which is beneficial for developing joints. To prepare, clean the chicken feet thoroughly, then simmer in water for several hours until the collagen has dissolved. Once cooked, strain the broth and use it as a base for soups or purees. This nutrient-rich broth can be combined with vegetables to create a flavorful meal for your baby."),
    
    ("Lamb", 10, 12, nil, ["Protein", "Iron", "Zinc"], 0, "Lamb is tender meat rich in flavor and nutrients, providing a hearty option for babies. To prepare, cook the lamb thoroughly until tender, then blend or finely chop it. It can be served alone or mixed with vegetables and grains for a well-balanced meal. Lamb introduces new flavors while ensuring your baby gets essential nutrients for growth."),
    
    ("Salmon", 10, 12, "Seafood", ["Omega-3 Fatty Acids", "Protein"], 0, "Salmon is rich in omega-3 fatty acids and protein, making it an excellent choice for brain development. To prepare, bake or steam the salmon until fully cooked. Once cooled, flake the fish into small pieces or blend it with vegetables for a smooth puree. Salmon offers a deliciously rich flavor while providing vital nutrients for your baby."),
    
    ("Shrimp", 10, 12, "Seafood", ["Protein", "Selenium", "Vitamin B12"], 1, "Shrimp is a delicate seafood packed with protein and essential nutrients. To prepare, boil or steam the shrimp until they are pink and cooked through, then chop finely or blend to a smooth puree. It can be mixed with vegetables or served alone, offering a flavorful and nutritious option for babies starting to explore seafood."),
    
    ("Clams", 10, 12, "Seafood", ["Protein", "Iron", "Vitamin B12"], 1, "Clams are a nutritious seafood option rich in protein and iron. To prepare, steam the clams until they open, then remove the meat from the shells and chop finely. You can mix the chopped clams into purees or incorporate them into dishes like risottos for a flavorful addition. Ensure they are well-cooked to provide a safe and tasty experience for your baby."),
    
    ("Strawberry", 6, 8, nil, ["Vitamin C", "Antioxidants"], 0, "Strawberries are tender, sweet fruits rich in vitamins and antioxidants. To prepare, wash the strawberries thoroughly, then remove the green tops. You can either serve them whole (if they're small enough) or mash them for younger babies. Blending them into a puree is also an option, and strawberries can be mixed with yogurt or other fruits for a delicious treat that supports your baby's immune system."),
    
    ("Mushroom", 8, 10, nil, ["Fiber", "Vitamin D", "B Vitamins"], 0, "Mushrooms are savory fungi packed with nutrients and flavor. To prepare, clean the mushrooms and slice them thinly. Sauté them until soft, which usually takes about 5-7 minutes, then blend or mash to your desired consistency. Mushrooms can be incorporated into various dishes, adding a rich umami flavor that enhances your baby's meals."),
    
    ("Tomato", 6, 8, nil, ["Vitamin C", "Potassium", "Antioxidants"], 0, "Tomatoes are versatile fruits packed with nutrients and flavor. To prepare, wash and chop the tomatoes, removing any seeds if desired. Cook them lightly to soften and blend into a smooth puree. Tomatoes can be mixed with other vegetables or served alone, providing a sweet and tangy option for your baby's palate, along with essential vitamins."),
    
    ("Tubers", 6, 8, nil, ["Carbohydrates", "Fiber", "Vitamins"], 0, "Tubers are hearty root vegetables that are filling and nutritious. To prepare, wash and peel the tubers (like sweet potatoes or yams), then chop into small pieces. Boil or steam until tender, about 15-20 minutes, and mash or blend to a smooth consistency. Tubers offer natural sweetness and can be mixed with other vegetables or served as a standalone dish, making them ideal for baby food."),
    
    ("Orange", 6, 8, nil, ["Vitamin C", "Fiber", "Folate"], 0, "Oranges are nutritious fruits that are sweet and tangy, packed with vitamin C. To prepare, peel the orange and remove any seeds, then cut it into small, manageable pieces or puree it for a smoother texture. Oranges can be served as a snack or mixed with other fruits for a vibrant fruit salad, offering hydration and essential nutrients for your baby."),
    
    ("Grape", 6, 8, nil, ["Vitamin C", "Antioxidants", "Fiber"], 0, "Grapes are sweet fruits known for their health benefits, rich in vitamins and antioxidants. To prepare, wash the grapes thoroughly, then cut them in half and remove any seeds. For younger babies, mash the grapes or blend into a puree. Grapes can be served as a snack or added to yogurt, providing a delicious way to boost your baby's nutrition."),
    
    ("Octopus", 10, 12, "Seafood", ["Protein", "Omega-3 Fatty Acids", "Selenium"], 1, "Octopus is a tender seafood rich in flavor and nutrients, making it a unique addition to baby food. To prepare, boil the octopus until tender, which usually takes about 30-40 minutes. Once cooled, chop finely or blend into a smooth puree. It can be mixed with vegetables or served on its own, providing a protein-packed meal that introduces new tastes."),
    
    ("Rice", 6, 8, nil, ["Carbohydrates", "B Vitamins", "Iron"], 0, "Rice is a tender, flavorful grain that is rich in carbohydrates and easy to digest. To prepare, rinse the rice thoroughly, then cook according to package instructions until soft, usually about 15-20 minutes. Once cooked, you can blend it with water or breast milk to create a smoother texture. Rice can be mixed with pureed vegetables or served alone, making it a staple in baby’s diet."),
    
    ("Cabbage", 8, 10, nil, ["Vitamins K", "C", "Fiber"], -1, "Cabbage is a versatile vegetable that is nutritious and filling. To prepare, wash and chop the cabbage, then steam or boil until soft, about 5-10 minutes. Once cooked, blend into a smooth puree or mash for a chunkier texture. Cabbage can be combined with other purees to introduce new flavors while ensuring your baby receives essential nutrients."),
    
    ("Asparagus", 8, 10, nil, ["Vitamins A", "K", "Folate", "C", "Potassium", "Phosphorus", "Vitamin E"], 0, "Asparagus is a crunchy vegetable often used in salads and stir-fries, rich in vitamins and minerals. To prepare, wash and trim the asparagus, then steam until tender, which usually takes about 5-7 minutes. Once cooked, blend or mash into a puree. Asparagus can be mixed with other vegetables to introduce diverse flavors and nutrients into your baby's meals."),
    
    ("Cow Milk", 10, 12, "Dairy", ["Calcium", "Protein", "Vitamin D"], 0, "Cow's milk is a nutrient-rich liquid that is versatile and can be introduced to babies after 12 months. To prepare, serve it plain or mixed with other foods like oatmeal or fruit purees for added flavor and nutrition. Ensure that you choose whole milk varieties to provide the essential fats needed for your baby's development. Cow's milk can also be used in cooking, enhancing the taste of many dishes.")
]
