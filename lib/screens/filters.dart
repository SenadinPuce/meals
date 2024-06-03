import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitch(
            value: activeFilters[Filter.glutenFree]!,
            onSwitchChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: 'Gluten-free',
            subtitle: 'gluten-free',
          ),
          FilterSwitch(
            value: activeFilters[Filter.lactoseFree]!,
            onSwitchChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: 'Lactose-free',
            subtitle: 'lactose-free',
          ),
          FilterSwitch(
            value: activeFilters[Filter.vegeterian]!,
            onSwitchChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterian, isChecked);
            },
            title: 'Vegeterian',
            subtitle: 'vegeterian',
          ),
          FilterSwitch(
            value: activeFilters[Filter.vegan]!,
            onSwitchChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: 'Vegan',
            subtitle: 'vegan',
          )
        ],
      ),
    );
  }
}
