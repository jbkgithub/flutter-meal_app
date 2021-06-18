import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;

    // //   _glutenFree = widget.currentFilters['gluten'] as bool;
    // _lactoseFree = widget.currentFilters['lactose'] as bool;
    // _vegetarian = widget.currentFilters['vegetarian'] as bool;
    // _vegan = widget.currentFilters['began'] as bool;

    super.initState();
  }

  // Widget _buildSwitchListTile(String title, String description,
  //     bool currentValue, Function updateValue) {
  //   return SwitchListTile(
  //       title: Text(title),
  //       value: currentValue,
  //       subtitle: Text(
  //         description,
  //       ),
  //       onChanged: updateValue());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
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
          children: <Widget>[
            SwitchListTile(
                title: Text('Gluten-free'),
                value: _glutenFree,
                subtitle: Text('include only gluten-free meals'),
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
            SwitchListTile(
                title: Text('Lactose-free'),
                value: _lactoseFree,
                subtitle: Text('include only lactose-free meals'),
                onChanged: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
            SwitchListTile(
                title: Text('Vegetarian'),
                value: _vegetarian,
                subtitle: Text('include only vegatarian meals'),
                onChanged: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),

            SwitchListTile(
                title: Text('Vegan'),
                value: _vegan,
                subtitle: Text('include only vegan meals'),
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),

            // _buildSwitchListTile(
            //     'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
            //     (newValue) {
            //   setState(() {
            //     _glutenFree = newValue;
            //   });
            // }),
            // _buildSwitchListTile(
            //   'Lactose-free',
            //   'Only include lactose-free meals.',
            //   _lactoseFree,
            //   (newValue) {
            //     setState(
            //       () {
            //         _lactoseFree = newValue;
            //       },
            //     );
            //   },
            // ),
            // _buildSwitchListTile(
            //   'Vegetarian',
            //   'Only include vegetarian meals.',
            //   _vegetarian,
            //   (newValue) {
            //     setState(
            //       () {
            //         _vegetarian = newValue;
            //       },
            //     );
            //   },
            // ),

            // _buildSwitchListTile(
            //   'Vegan',
            //   'Only include vegan meals.',
            //   _vegan,
            //   (newValue) {
            //     setState(
            //       () {
            //         _vegan = newValue;
            //       },
            //     );
            //   },
            // ),
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
