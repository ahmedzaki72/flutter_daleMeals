import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/screens/Fitters_screen.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:delimeals/screens/meal_detail_screen.dart';
import 'package:delimeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealId),
        );
      });
    }
  }

  bool isMealFavorite (String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favorite: _favoriteMeals),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CategoryMealsScreen.id: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.id: (context) => MealDetailScreen(toggleFavorite : toggleFavorite, isFavorite: isMealFavorite),
        FilterScreen.id: (context) =>
            FilterScreen(currentFilters: _filters, saveFilter: _setFilters),
      },

      /// using this function when pass unknown navigation not register in routes and when pass this you will going me to route find in this function.
      // onGenerateRoute: (settings) {
      //   print(setting.arguments);
      //   /// you can using if statement here if setting.name == mealDetailScreen.id adding
      //   if(settings.name == mealDetailScreen.id){
      //     return
      //   }else if (settings.name == mealDetailScreen.id){
      //     return
      //   }
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      /// using unKnownRoute when not found screen in route and  also not fount function onGenerateRoute you will using unKnownRoute.
      /// using this function when have navigation not using in route and this will crash app you can using by default go to CategoriesScreen.
      // onUnknownRoute: (settings) {
      //    return MaterialPageRoute( builder:  (ctx) => CategoriesScreen());
      // },
    );
  }
}
