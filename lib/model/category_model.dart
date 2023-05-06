class Categories {
  String image;
  final String categoryTitle;
  Categories({
    required this.image,
    required this.categoryTitle,
  });
}

List<Categories> category = [
  Categories(
    image: 'asset/images/categories/Fresh_fruits.png',
    categoryTitle: 'Fresh fruits',
  ),
  Categories(
    categoryTitle: 'Cooking oil',
    image: 'asset/images/categories/Cooking_oil.png',
  ),
  Categories(
    categoryTitle: 'Meat and Fish',
    image: 'asset/images/categories/Meat_fish.png',
  ),
  Categories(
    categoryTitle: 'Bakery and Snacks',
    image: 'asset/images/categories/Backery_snacks.png',
  ),
  Categories(
    categoryTitle: 'Dairy and Egg',
    image: 'asset/images/categories/Dairy_eggs.png',
  ),
  Categories(
    categoryTitle: 'Baverages',
    image: 'asset/images/categories/Beverages.png',
  ),
  Categories(
    categoryTitle: 'Juice',
    image: 'asset/images/categories/Juice.png',
  ),
  Categories(
    categoryTitle: 'Pasta',
    image: 'asset/images/categories/Pasta.png',
  ),
];
