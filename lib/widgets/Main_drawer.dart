import 'package:delimeals/screens/Fitters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {


  Widget buildingListTile(IconData icon, String title, Function tapHandler) {
    return  ListTile(
      leading: Icon(
       icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up !',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildingListTile(Icons.restaurant, 'Meals' ,() {
            // Navigator.of(context).pushNamed('/');
            /// I will using PushReplacemenetName mean replace exciting page with new page in stack not adding another stack.
            ///  they don't add a new page in the top and you replace when navigation another pages.
            Navigator.of(context).pushReplacementNamed('/');
    },),
          buildingListTile(Icons.settings, 'Filters', () {
           // Navigator.of(context).pushNamed(FilterScreen.id);
            Navigator.of(context).pushReplacementNamed(FilterScreen.id);
          },),
        ],
      ),
    );
  }
}
