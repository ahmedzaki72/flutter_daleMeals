import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/models/meal.dart';
import '../components/buildSectionTitle.dart';
import 'package:flutter/material.dart';
import '../components/build_container.dart';

class MealDetailScreen extends StatelessWidget {
  static const String id = 'meal_Detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen({this.toggleFavorite, this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeals =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeals.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network(
                selectMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSectionTitle('ingredients'),
            BuildingContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectMeals.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectMeals.ingredients.length,
              ),
            ),
            BuildSectionTitle('steps'),
            BuildingContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)} '),
                      ),
                      title: Text(
                        selectMeals.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectMeals.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   Navigator.of(context).pop(mealId);
        // },
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border
        ),
      ),
    );
  }
}
