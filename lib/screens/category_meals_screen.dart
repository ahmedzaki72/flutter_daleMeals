import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String id = 'category_meals_screen';

  final List<Meal> availableMeals;
  CategoryMealsScreen({this.availableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   String categoryTitle;
   List<Meal> displayMeals;
   var _loadedIniData = false;

  // @override
  // void initState() {
  //
  //   super.initState();
  // }
  /// note if you have any context or widget you not working in initState and you will working in didChangeDependencies.
  @override
  void didChangeDependencies() {
    if(!_loadedIniData) {
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      _loadedIniData = true;
    }
    super.didChangeDependencies();
  }

  void removeModel (String mealId){
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: removeModel,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
