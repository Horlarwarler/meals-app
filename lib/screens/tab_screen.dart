import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/dummy_meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screens.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  var currentIndex = 0;

  final List<Meal> favouriteMeals = [];

  var savedFilter = {
    Filter.gluttonFree: false,
    Filter.lactoseFree: false,
    Filter.vegans: false,
    Filter.vegetarian: false
  };

  var title = "Categories";

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Meal> get appliedFilter {
    return dummyMeals.where((element) {
      if (savedFilter[Filter.gluttonFree]! && !element.isGlutenFree) {
        return false;
      }
      if (savedFilter[Filter.lactoseFree]! && !element.isLactoseFree) {
        return false;
      }
      if (savedFilter[Filter.vegans]! && !element.isVegan) {
        return false;
      }
      if (savedFilter[Filter.vegetarian]! && !element.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
  }

  void onSelectMenu(String selectedMenu) async {
    Navigator.pop(context);
    if (selectedMenu == "Filters") {
      final returnedFilter =
          await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (ctx) => FilterScreen(savedFilter: savedFilter)),
      );
      savedFilter = returnedFilter ?? savedFilter;
    }
  }

  void onFavouriteClick(Meal meal) {
    final alreadyExist = favouriteMeals.contains(meal);
    ScaffoldMessenger.of(context).clearSnackBars();
    if (alreadyExist) {
      setState(() {
        favouriteMeals.remove(meal);
      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            alreadyExist ? " Removed from Favourite" : "Added to favourite")));
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (currentIndex == 1) {
      title = "Favourites";
      content = MealScreen(
        onFavouriteClick: onFavouriteClick,
        meals: favouriteMeals,
      );
    } else {
      content = CategoryScreen(
          onFavouriteClick: onFavouriteClick, appliedFilter: appliedFilter);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
      ),
      drawer: MainDrawer(
        onSelectMenu: onSelectMenu,
      ),
    );
  }
}
