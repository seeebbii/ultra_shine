import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_vehicle_type.dart';



class Custom_drawer extends StatefulWidget {
  const Custom_drawer({ Key? key }) : super(key: key);

  @override
  _Custom_drawerState createState() => _Custom_drawerState();
}

class _Custom_drawerState extends State<Custom_drawer> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,
    duration: Duration(milliseconds :400));
  }
  @override
  Widget build(BuildContext context) {
    var drawer=Container(color:Colors.orangeAccent,child: Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.redAccent,
        ),
        child: Text('UltraShine(Txt placeholder)'),
      ),
      drawer_tile(CupertinoIcons.home,'Feed'),
          drawer_tile(CupertinoIcons.search_circle,'Explore'),
              drawer_tile(CupertinoIcons.video_camera,'Videos'),
                  drawer_tile(CupertinoIcons.settings,'Settings'),
   
    ],
  ),
),);
    var home=Container(decoration: BoxDecoration(
      color: Colors.redAccent,
        boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    ),
      child: ChooseVehicleType(animation: toggleAnimation,)
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){},
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context,_) {
            double slide=125.0*animationController.value;
            double scale=1-(animationController.value*0.1);
            return Stack(
              
              children: [
                drawer,
                Transform(transform: Matrix4.identity()..translate(slide)..scale(scale),
                alignment:Alignment.bottomCenter,
                child: home),
              ],
              
            );
          }
        ),
      ),
    );
  }

  ListTile drawer_tile(IconData icon,String title) {
    return ListTile(
    leading: Icon(icon),
      title:Text(title,style: TextStyle(color: Colors.black)),
   
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }
  void toggleAnimation()
  {
    animationController.isDismissed?
    animationController.forward():
    animationController.reverse();
  }
}