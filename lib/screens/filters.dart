import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactosFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
   return _FiltersScreenState();
  }

}

class _FiltersScreenState extends State<FiltersScreen>{

  var _glutenFreeFilterSet = false;
  var _lactosFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactosFreeFilterSet = widget.currentFilters[Filter.lactosFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),

      /*drawer: MainDrawer(
        onSelectScreen: (identifier){
          Navigator.pop(context);
          if(identifier=='meals'){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const TabScreen()));
          }
        },
      ),*/

      body: WillPopScope (
        onWillPop:  () async{
          Navigator.of(context).pop({
            Filter.glutenFree:_glutenFreeFilterSet,
            Filter.lactosFree:_lactosFreeFilterSet,
            Filter.vegetarian:_vegetarianFilterSet,
            Filter.vegan:_veganFilterSet,
          });
          return false;
        },

        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                  'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              subtitle: Text(
                'only includes gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              activeColor: Theme.of(context).colorScheme.tertiary,

              contentPadding: const EdgeInsets.only(left: 34, right: 22),

            ),


            SwitchListTile(
              value: _lactosFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactosFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              subtitle: Text(
                'only include lactos-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              activeColor: Theme.of(context).colorScheme.tertiary,

              contentPadding: const EdgeInsets.only(left: 34, right: 22),

            ),

            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              subtitle: Text(
                'only vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              activeColor: Theme.of(context).colorScheme.tertiary,

              contentPadding: const EdgeInsets.only(left: 34, right: 22),

            ),

            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              subtitle: Text(
                'only vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),

              activeColor: Theme.of(context).colorScheme.tertiary,

              contentPadding: const EdgeInsets.only(left: 34, right: 22),

            )

          ],
        ),
      ),
    );

  }

}