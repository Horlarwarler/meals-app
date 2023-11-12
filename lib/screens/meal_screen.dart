import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      required this.onFavouriteClick,
      this.title,
      required this.meals});
  final String? title;
  final void Function(Meal) onFavouriteClick;
  final List<Meal> meals;

  void onItemClick(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meal: meal,
          onFavouriteClick: onFavouriteClick,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emptyContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Nothing to Display",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title == null
              ? "Try Add New Favourite Meals"
              : "Try Selecting a new filter or chossing new category",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    );
    final body = meals.isEmpty
        ? emptyContent
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onItemClick: () {
                onItemClick(context, meals[index]);
              },
            ),
          );
    final content = title != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            body: body)
        : body;
    return content;
  }
}
