import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../dummy_data.dart';
import '../widgets/categories_items.dart';


class CategoriesScreen extends StatelessWidget {
  static const String id = 'category_screen';

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((e) => CategoriesItems(
          // onPressed: (){
          //   print('working');
          // },
          id: e.id,
          color: e.color,
          title: e.title,
        ),).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2 ,
          crossAxisSpacing:  20,
          mainAxisSpacing: 20
      ),
    );
  }
}
