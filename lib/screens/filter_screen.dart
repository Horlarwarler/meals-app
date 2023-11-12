import 'package:flutter/material.dart';

enum Filter { gluttonFree, lactoseFree, vegetarian, vegans }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.savedFilter});

  final Map<Filter, bool> savedFilter;
  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var gluttonFree = false;
  var lactoseFree = false;

  var vegetarian = false;

  var vegans = false;

  @override
  void initState() {
    super.initState();
    final savedFilter = widget.savedFilter;
    gluttonFree = savedFilter[Filter.gluttonFree]!;
    lactoseFree = savedFilter[Filter.lactoseFree]!;
    vegetarian = savedFilter[Filter.vegetarian]!;
    vegans = savedFilter[Filter.vegans]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttonFree: gluttonFree,
            Filter.lactoseFree: lactoseFree,
            Filter.vegetarian: vegetarian,
            Filter.vegans: vegans
          });
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              SwitchListTile(
                value: gluttonFree,
                onChanged: (value) {
                  setState(
                    () {
                      gluttonFree = value;
                    },
                  );
                },
                title: Text(
                  "Glutton Free",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Set Whether Should Include Glutton",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              SwitchListTile(
                value: lactoseFree,
                onChanged: (value) {
                  setState(
                    () {
                      lactoseFree = value;
                    },
                  );
                },
                title: Text(
                  "Lactose Free",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Set Whether Should Include Lactose",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              SwitchListTile(
                value: vegans,
                onChanged: (value) {
                  setState(
                    () {
                      vegans = value;
                    },
                  );
                },
                title: Text(
                  "Vegans",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Set Whether Should Include Vegans",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              SwitchListTile(
                value: vegetarian,
                onChanged: (value) {
                  setState(
                    () {
                      vegetarian = value;
                    },
                  );
                },
                title: Text(
                  "Vegetarians",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Set Whether Should Include for Vegetarians",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
