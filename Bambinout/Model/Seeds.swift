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

let seedIngredients: [(name: String, minMonths: Int, maxMonths: Int, allergen: String?, nutritions: [String], weightSuitability: Int, description: String, imageName: String)] = [
    ("Carrot", 6, 8, nil, ["Vitamin A", "Fiber", "Potassium"], 0, "Carrots are crunchy root vegetables rich in beta-carotene and fiber. To prepare, wash, peel, and cut them into small pieces or steam until tender. You can serve them as sticks for babies to hold or puree them with a little water or breast milk to create a soft, spreadable consistency. This can be served alone or topped with smooth fruit purees. It offers a great way to introduce grains into your baby’s diet while providing essential nutrients.", "carrot"),
    
    ("Peas", 6, 8, nil, ["Vitamin K", "Protein", "Fiber"], 0, "Peas are small, sweet green spheres packed with nutrients. To prepare, steam or boil the peas until tender, then mash or puree them to your desired consistency. They can be served as a smooth puree or as whole peas for older babies learning to self-feed. Peas provide essential vitamins and a pop of sweetness that babies often enjoy.", "peas"),
    
    ("Banana", 6, 8, nil, ["Potassium", "Vitamin C", "Fiber"], -1, "Bananas are soft, sweet fruits known for their high potassium content. To prepare, simply peel the banana and mash it with a fork until smooth. For younger babies, you can blend it with a little water or breast milk to achieve a thinner consistency. Bananas are a great first food and can be mixed with other fruits for added flavor.", "banana"),
    
    ("Avocado", 6, 8, nil, ["Healthy Fats", "Vitamin E", "Fiber"], 1, "Avocados are creamy fruits full of healthy fats and nutrients. To prepare, cut the avocado in half, remove the pit, and scoop out the flesh. Mash it until smooth, or blend with a little water or breast milk for a creamier texture. Avocado can be served alone or mixed with other purees, providing essential healthy fats for your baby's development.", "avocado"),
    
    ("Apples (cooked)", 6, 8, nil, ["Vitamin C", "Fiber"], 0, "Cooked apples are soft and naturally sweet, making them ideal for baby food. To prepare, peel and chop the apples, then cook them in a pot with a little water until soft. Blend or mash the cooked apples to your desired consistency. They can be served plain or mixed with other fruits, providing a delightful treat packed with vitamins.", "apples_cooked"),
    
    ("Oatmeal", 6, 8, "Gluten", ["Fiber", "Iron", "Protein"], -1, "Oatmeal is a warm, hearty grain perfect for breakfast. To prepare, cook the oats according to package instructions with water or milk until soft. For younger babies, blend with a little water or breast milk to create a soft, spreadable consistency. Oatmeal can be mixed with pureed fruits for added flavor and nutrients, making it a wholesome option for your baby.", "oatmeal"),
    
    ("Zucchini", 6, 8, nil, ["Vitamin C", "Potassium", "Fiber"], 0, "Zucchini is a versatile squash often used in savory and sweet dishes. To prepare, wash and chop the zucchini, then steam or sauté until tender. Once cooked, blend or mash to a smooth consistency. Zucchini can be served alone or mixed with other vegetables, introducing a mild flavor and essential nutrients to your baby's meals.", "zucchini"),
    
    ("Pumpkin", 6, 8, nil, ["Vitamin A", "Fiber", "Potassium"], 0, "Pumpkin is a sweet and nutritious squash used in pies and soups. To prepare, peel and chop the pumpkin, then steam or boil until soft. Blend until smooth, and it can be mixed with spices for flavor. Pumpkin is rich in vitamins and provides a creamy texture that babies love, making it a great addition to their diet.", "pumpkin"),
    
    ("Chicken (pureed)", 8, 10, nil, ["Protein", "Iron", "Zinc"], 0, "Pureed chicken provides protein and essential minerals for growing babies. To prepare, cook the chicken thoroughly until tender, then blend with a little broth or water until smooth. This nutritious puree can be served alone or mixed with vegetables for a balanced meal that supports healthy growth.", "chicken_pureed"),
    
    ("Pear (cooked)", 8, 10, nil, ["Vitamin C", "Fiber"], 0, "Soft, sweet cooked pears are easy to digest and great for babies. To prepare, peel and chop the pears, then cook in a pot with a little water until soft. Blend or mash to the desired consistency. Pears provide natural sweetness and can be mixed with other purees to enhance flavor and nutrition.", "pear_cooked"),
    
    ("Broccoli (cooked)", 8, 10, nil, ["Vitamin C", "Fiber", "Calcium"], 0, "Broccoli is a nutrient-dense vegetable known for its health benefits. To prepare, wash and chop the broccoli, then steam or boil until soft. Blend into a smooth puree or serve as soft florets for older babies. Broccoli offers essential vitamins and a vibrant green color that can encourage your baby to explore new tastes.", "broccoli_cooked"),
    
    ("Mango (pureed)", 8, 10, nil, ["Vitamin A", "Vitamin C", "Fiber"], 0, "Mango is a sweet, tropical fruit rich in vitamins and flavor. To prepare, peel the mango and remove the pit, then blend the flesh until smooth. This puree can be served alone or mixed with other fruits, providing a delicious treat that introduces tropical flavors to your baby's diet.", "mango_pureed"),
    
    ("Yogurt (plain, whole milk)", 10, 12, "Dairy", ["Calcium", "Protein", "Probiotics"], 1, "Plain, whole milk yogurt is creamy and provides probiotics essential for digestion. To serve, offer plain yogurt in a small bowl, and it can be mixed with fruits or purees for added flavor. Yogurt is a nutritious snack that supports gut health and can be introduced as a healthy dairy option for your baby.", "yogurt_plain_whole_milk"),
    
    ("Beef (pureed)", 10, 12, nil, ["Iron", "Protein", "Zinc"], 1, "Pureed beef is rich in iron and essential vitamins, making it a hearty choice for babies. To prepare, cook the beef thoroughly until tender, then blend with broth or water until smooth. This protein-packed puree can be served alone or mixed with vegetables for a nutritious meal that supports growth and development.", "beef_pureed"),
    
    ("Chickpeas (pureed)", 10, 12, nil, ["Protein", "Fiber", "Iron"], 0, "Chickpeas are packed with protein and fiber, making them a nutritious option. To prepare, cook the chickpeas until tender, then blend with a little water or broth to create a creamy puree. Chickpeas can be served alone or mixed with spices to introduce new flavors while providing essential nutrients for your baby.", "chickpeas_pureed"),
    
    ("Potatoes", 10, 12, nil, ["Vitamin C", "Potassium", "Fiber"], -1, "Potatoes are soft, starchy tubers that are versatile and filling. To prepare, wash and peel the potatoes, then chop and boil until tender. Mash or blend to a smooth consistency, and you can mix with other vegetables for a heartier meal. Potatoes offer a mild flavor and are a great source of carbohydrates for your baby.", "potatoes"),
    
    ("Spinach (cooked)", 10, 12, nil, ["Iron", "Vitamin K", "Fiber"], 0, "Spinach is a leafy green rich in iron and vitamins. To prepare, wash the spinach thoroughly, then steam or boil until wilted. Blend or chop finely to create a smooth or textured puree, and it can be mixed with fruits or other vegetables for added nutrition. Spinach is a fantastic way to introduce greens to your baby's diet.", "spinach_cooked"),
    
    ("Whole Grain Bread", 10, 12, "Gluten", ["Fiber", "B Vitamins", "Iron"], -1, "Whole grain bread is a wholesome option for introducing grains to babies. To prepare, toast the bread lightly and then cut it into small, manageable pieces. It can be served plain or topped with spreads like mashed avocado or nut butters (if age-appropriate), offering a nutritious snack that is rich in fiber.", "whole_grain_bread"),
    
    ("Cheese (soft, mild)", 10, 12, "Dairy", ["Calcium", "Protein", "Vitamin A"], 0, "Soft, mild cheese is a great source of calcium and protein for babies. To prepare, cut the cheese into small, manageable pieces or grate it for easier eating. It can be served on its own or melted into other dishes like vegetables or pasta for added flavor. Cheese can also be combined with fruits for a delightful snack, providing both taste and nutrition.", "cheese_soft_mild"),
    
    ("Noodle / Pasta (cooked)", 10, 12, "Gluten", ["Carbohydrates", "B Vitamins", "Iron"], 0, "Cooked noodles or pasta are soft and a staple in many cuisines, making them ideal for babies. To prepare, cook the pasta according to package instructions until soft. Once cooked, drain and cut into small pieces if necessary. Noodles can be served plain or tossed with a little olive oil and pureed vegetables, providing a tasty and nutritious meal.", "noodle_pasta_cooked"),
    
    ("Watermelon", 8, 10, nil, ["Vitamin C", "Vitamin A"], 0, "Watermelon is a juicy, hydrating fruit perfect for hot weather. To prepare, remove the rind and seeds, then cut the watermelon into small pieces or blend into a smooth puree. This refreshing fruit can be served as a snack or mixed with yogurt for a delicious treat. Watermelon is a great way to introduce hydration and vitamins into your baby's diet.", "watermelon"),
    
    ("Tuna", 10, 12, "Seafood", ["Protein", "Omega-3 Fatty Acids", "Selenium"], 1, "Tuna is a flaky seafood rich in protein and healthy fats. To prepare, use canned tuna packed in water, rinsed thoroughly, then mash or blend into a smooth puree. Tuna can be mixed with vegetables or served on its own, providing a nutritious option for your baby that introduces new flavors and essential nutrients.", "tuna"),
    
    ("Almond", 10, 12, "Nuts", ["Healthy Fats", "Protein", "Vitamin E"], 1, "Almonds are crunchy nuts rich in healthy fats and vitamins. To prepare, soak the almonds to soften them, then blend into a smooth almond butter or finely grind for older babies. Almonds can be added to oatmeal or yogurt for added flavor and nutrition. Ensure they are introduced safely, as nuts can be allergens for some babies.", "almond"),
    
    ("Eggplant", 8, 10, nil, ["Fiber", "Antioxidants", "Vitamins B1 & B6"], 0, "Eggplant is a versatile vegetable that absorbs flavors well. To prepare, wash and chop the eggplant, then bake or steam until tender. Once cooked, blend or mash into a smooth puree. Eggplant can be mixed with other vegetables or served with grains, providing a unique flavor and nutritious options for your baby.", "eggplant"),
    
    ("Corn", 6, 8, nil, ["Carbohydrates", "Fiber", "Vitamin C"], 0, "Corn is sweet and packed with nutrients, making it a delightful treat for babies. To prepare, cook the corn until tender, either by boiling or steaming, then remove the kernels from the cob. Blend or mash the corn for younger babies, or serve whole kernels for older babies. Corn can be added to other purees or served as a side dish, providing sweetness and texture.", "corn"),
    
    ("Tempe", 10, 12, "Nuts", ["Protein", "Fiber", "Iron"], 0, "Tempeh is a fermented soy product rich in protein and flavor. To prepare, slice or crumble the tempeh, then steam or sauté until heated through. It can be blended into a puree or served in small pieces for older babies. Tempeh offers a unique flavor and texture, making it a nutritious addition to meals for babies.", "tempe"),
    
    ("Tofu", 8, 10, "Nuts", ["Protein", "Calcium", "Iron"], 0, "Tofu is a soft soy product that is a great source of protein. To prepare, cut the tofu into small cubes or blend until smooth. Tofu can be steamed, sautéed, or added to soups and stews, offering a versatile ingredient that can be mixed with other flavors while ensuring a nutritious option for your baby.", "tofu"),
    
    ("Pineapple", 6, 8, nil, ["Vitamin C", "Manganese", "Bromelain"], 0, "Pineapple is a tropical fruit known for its sweet, tangy flavor. To prepare, peel and core the pineapple, then cut it into small pieces or blend until smooth. Pineapple can be served as a snack or mixed with other fruits for a refreshing fruit salad. It provides hydration and essential nutrients, making it a great addition to your baby's diet.", "pineapple"),
    
    ("Chicken Feet", 10, 12, nil, ["Protein", "Collagen"], 0, "Chicken feet are rich in collagen and often used in soups and broths. To prepare, boil the chicken feet until tender, then strain the broth and use it as a base for soups. The tender meat can be removed and shredded to serve. This unique ingredient offers a nutritious option for introducing flavors and textures to your baby's meals.", "chicken_feet"),
    
    ("Lamb", 10, 12, nil, ["Protein", "Iron", "Zinc"], 0, "Lamb is tender meat rich in flavor and nutrients, providing essential proteins for your baby. To prepare, cook the lamb thoroughly until tender, then blend with broth or water to create a smooth puree. This protein-packed option can be mixed with vegetables for a well-rounded meal that supports growth.", "lamb"),
    
    ("Salmon", 10, 12, "Seafood", ["Omega-3 Fatty Acids", "Protein"], 0, "Salmon is tender fish rich in flavor and nutrients, making it a nutritious addition to baby food. To prepare, cook the salmon until fully cooked through, then flake or blend into a smooth puree. Salmon can be served alone or mixed with vegetables or grains for a balanced meal that introduces healthy fats and proteins.", "salmon"),
    
    ("Shrimp", 10, 12, "Seafood", ["Protein", "Selenium", "Vitamin B12"], 1, "Shrimp is a rich, flaky seafood high in omega-3 fatty acids. To prepare, boil or steam the shrimp until pink and opaque, then remove the shells and blend into a smooth puree or chop finely for older babies. Shrimp can be mixed with vegetables or served alone, providing a tasty option rich in nutrients.", "shrimp"),
    
    ("Clams", 10, 12, "Seafood", ["Protein", "Iron", "Vitamin B12"], 1, "Clams are creamy and packed with protein and iron, making them a nutritious choice for babies. To prepare, steam the clams until they open, then remove the meat and blend or chop finely. Clams can be mixed with rice or vegetables for a unique meal that introduces flavors and essential nutrients.", "clams"),
    
    ("Strawberry", 6, 8, nil, ["Vitamin C", "Antioxidants"], 0, "Strawberries are tender fruits rich in vitamins and antioxidants. To prepare, wash the strawberries, remove the stems, and mash or puree until smooth. For younger babies, blending with a little water can help achieve a smoother texture. Strawberries can be served alone or mixed with yogurt for a delightful snack that provides hydration and flavor.", "strawberry"),
    
    ("Mushroom", 8, 10, nil, ["Fiber", "Vitamin D", "B Vitamins"], 0, "Mushrooms are savory fungi packed with nutrients and flavor. To prepare, clean and chop the mushrooms, then sauté until tender. Once cooked, blend into a smooth puree or serve in small pieces for older babies. Mushrooms can be incorporated into other dishes, adding umami flavor and essential nutrients to your baby's meals.", "mushroom"),
    
    ("Tomato", 6, 8, nil, ["Vitamin C", "Potassium", "Antioxidants"], 0, "Tomatoes are versatile fruits packed with nutrients and flavor. To prepare, wash the tomatoes, remove the core, and steam or boil until soft. Blend until smooth, and it can be mixed with other vegetables or served as a puree. Tomatoes provide hydration and essential vitamins, making them a great addition to your baby's meals.", "tomato"),
    
    ("Tubers", 6, 8, nil, ["Carbohydrates", "Fiber", "Vitamins"], 0, "Tubers are hearty root vegetables that are filling and nutritious. To prepare, wash and peel the tubers, then chop and boil until tender. Mash or blend to a smooth consistency, and they can be mixed with other purees or served on their own. Tubers provide essential carbohydrates and nutrients for your baby's growth and development.", "tubers"),
    
    ("Orange", 6, 8, nil, ["Vitamin C", "Fiber", "Folate"], 0, "Oranges are sweet and tangy fruits that offer hydration and essential nutrients. To prepare, peel the orange and remove any seeds, then cut into small, manageable pieces for older babies. For younger babies, you can blend into a smooth puree for a smoother texture. Oranges can be served as a snack or mixed with other fruits for a vibrant fruit salad.", "orange"),
    
    ("Grape", 6, 8, nil, ["Vitamin C", "Antioxidants", "Fiber"], 0, "Grapes are sweet fruits known for their health benefits, rich in vitamins and antioxidants. To prepare, wash the grapes thoroughly, then cut them in half and remove any seeds. For younger babies, mash the grapes or blend into a puree. Grapes can be served as a snack or added to yogurt, providing a delicious way to boost your baby's nutrition.", "grape"),
    
    ("Octopus", 10, 12, "Seafood", ["Protein", "Omega-3 Fatty Acids", "Selenium"], 1, "Octopus is a tender seafood rich in flavor and nutrients. To prepare, boil or steam the octopus until tender, then chop finely or blend into a smooth puree. Octopus can be mixed with vegetables or served alone, providing a unique and nutritious option for your baby, introducing them to new flavors.", "octopus"),
    
    ("Rice", 6, 8, nil, ["Carbohydrates", "B Vitamins", "Iron"], 0, "Rice is a tender, flavorful grain rich in nutrients, making it an excellent base for baby food. To prepare, rinse the rice and cook according to package instructions until soft. For younger babies, blend the cooked rice with water or broth to create a smooth puree. Rice can be served plain or mixed with fruits or vegetables for a balanced meal.", "rice"),
    
    ("Cabbage", 8, 10, nil, ["Vitamins K", "C", "Fiber"], -1, "Cabbage is a versatile vegetable that is nutritious and filling. To prepare, wash and chop the cabbage, then steam or boil until tender. Blend or mash to a smooth consistency or serve in small pieces for older babies. Cabbage can be mixed with other vegetables or served alone, providing essential vitamins and fiber for your baby.", "cabbage"),
    
    ("Asparagus", 8, 10, nil, ["Vitamins A", "K", "Folate", "C", "Potassium", "Phosphorus", "Vitamin E"], 0, "Asparagus is a crunchy vegetable often used in salads and stir-fries. To prepare, wash and trim the ends, then steam or boil until tender. Blend or chop finely for a smooth or textured puree. Asparagus offers a unique flavor and is rich in nutrients, providing a great option for introducing vegetables to your baby's diet.", "asparagus"),
    
    ("Cow Milk", 10, 12, "Dairy", ["Calcium", "Protein", "Vitamin D"], 0, "Cow milk is a nutrient-rich liquid that is versatile for cooking and baking. To serve, it can be introduced in small amounts, mixed with other foods or served in a cup. Cow milk provides essential nutrients like calcium and protein, supporting healthy growth and development for older babies.", "cow_milk")
]

