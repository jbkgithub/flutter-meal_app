import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _builderSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(
          description,
        ),
        onChanged: updateValue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            '',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _builderSwitchListTile(
                'Gluten-free', 'Only inlcude gluten-free meals', _glutenFree,
                (newValue) {
              _glutenFree = newValue;
            }),
            _builderSwitchListTile(
                'Lactose-free', 'Only inlcude Lactose-free meals', _lactoseFree,
                (newValue) {
              _lactoseFree = newValue;
            }),
            _builderSwitchListTile('Vegan', 'Only inlcude Vegan meals', _vegan,
                (newValue) {
              _vegan = newValue;
            }),

            _builderSwitchListTile(
                'Vegetarian', 'Only inlcude Vegetarian meals', _vegetarian,
                (newValue) {
              _vegetarian = newValue;
            }),
            // SwitchListTile(
            //   title: Text('Gluten-free'),
            //   value: _glutenFree,
            //   subtitle: Text(
            //     'Only include gluten-free meals.',
            //   ),
            //   onChanged: (newValue) {
            //     _glutenFree = newValue;
            //   },
            // ),
          ],
        )),
      ]),
    );
  }
}
