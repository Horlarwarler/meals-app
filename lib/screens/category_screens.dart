import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/categories_dummy.dart';
import 'package:meals_app/dummy_data/dummy_meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.onFavouriteClick, required this.appliedFilter});
  final void Function(Meal) onFavouriteClick;
  final List<Meal> appliedFilter;

  void _onCategoryClick(BuildContext context, Category category) {
    final filteredMeals = appliedFilter
        .where(
          (element) => element.categories.contains(category.id),
        )
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealScreen(
          title: category.title,
          onFavouriteClick: onFavouriteClick,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: [
          ...availableCategories
              .map(
                (category) => CategoryGridItem(
                  category: category,
                  onClick: () {
                    _onCategoryClick(context, category);
                  },
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
