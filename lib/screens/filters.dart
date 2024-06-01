import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';

enum Filter { glutenFree, lactoseFree, vegeterian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegeterianFilterSet = widget.currentFilters[Filter.vegeterian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegeterian: _vegeterianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            FilterSwitch(
              value: _glutenFreeFilterSet,
              onSwitchChanged: ((isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              }),
              title: 'Gluten-free',
              subtitle: 'gluten-free',
            ),
            FilterSwitch(
              value: _lactoseFreeFilterSet,
              onSwitchChanged: ((isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              }),
              title: 'Lactose-free',
              subtitle: 'lactose-free',
            ),
            FilterSwitch(
              value: _vegeterianFilterSet,
              onSwitchChanged: ((isChecked) {
                setState(() {
                  _vegeterianFilterSet = isChecked;
                });
              }),
              title: 'Vegeterian',
              subtitle: 'vegeterian',
            ),
            FilterSwitch(
              value: _veganFilterSet,
              onSwitchChanged: ((isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              }),
              title: 'Vegan',
              subtitle: 'vegan',
            )
          ],
        ),
      ),
    );
  }
}
