import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectMenu});

  final void Function(String) onSelectMenu;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Row(
              children: [
                Icon(
                  Icons.cookie,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Cooking Up",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectMenu("Meals");
            },
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 22),
            ),
            leading: const Icon(
              Icons.breakfast_dining_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
          ListTile(
            onTap: () {
              onSelectMenu("Filters");
            },
            title: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 22),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 22,
            ),
          )
        ],
      ),
    );
  }
}
