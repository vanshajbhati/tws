import 'package:flutter/material.dart';
import 'package:tws/fragment/diettab.dart';
import 'package:tws/fragment/newprifletab.dart';
import 'package:tws/fragment/workouttab.dart';

class NewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF2CB3BF),
            bottom: TabBar(
              tabs: [
                Tab(text: "Profile",),
                Tab(text: "Diet"),
                Tab(text: "Workout",),
                Tab(text: "Gallery",),
              ],
            ),
            title: Text('Harshit'),
          ),
          body: TabBarView(
            children: [
              NewProfileTab(),
              DietTab(),
              WorkoutTab(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

