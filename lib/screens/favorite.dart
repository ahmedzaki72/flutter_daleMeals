import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favorite;
  Favorite({this.favorite});
  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Center(
        child: Text('You no have favorite yet - start adding some !'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorite[index].id,
            title: favorite[index].title,
            imageUrl: favorite[index].imageUrl,
            duration: favorite[index].duration,
            complexity: favorite[index].complexity,
            affordability: favorite[index].affordability,
          );
        },
        itemCount: favorite.length,
      );
    }
  }
}
