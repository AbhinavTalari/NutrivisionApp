import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/home_screen.dart';

class LandingPage extends StatelessWidget {
  static const routeName = '/landing-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/landingpage5.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(16),
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Nutri Vision",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.pink,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Overpass'),
                        ),
                        Text(
                          "Search Food!",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Overpass'),
                        )
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.emoji_food_beverage),
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
