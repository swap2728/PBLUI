import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:untitled3/page1.dart';
import 'package:untitled3/page2.dart';
import 'package:untitled3/login_page.dart';
import 'package:untitled3/profile_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:untitled3/splash_screen.dart';
import 'sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventory',
        home: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: MyCustomWidget(),
        ),
      );
  }
}



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>  {
  int index=0;

  final screen = [
    Page1(),
    Page2(),
    ProfilePage(),
    Sample(),
    // page3(),
    // page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: screen[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.grey,
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index)=>setState(() {
            this.index=index;
          }),
          destinations: [
            NavigationDestination(
                icon:  Icon(Icons.home, color: Colors.white70,
                size: 36,),
                selectedIcon: Icon(Icons.home),
                label: 'HOME'
            ),

            NavigationDestination(
                icon:  Icon(Icons.shopping_bag, color: Colors.white70,
                size: 34,),
                selectedIcon: Icon(Icons.shopping_bag),
                label: 'STOCKLEFT'
            ),

            // NavigationDestination(
            //     icon:  Icon(Icons.email, color: Colors.white70,),
            //     selectedIcon: Icon(Icons.email),
            //     label: 'home'
            // ),
            //
            NavigationDestination(
                icon:  Icon(Icons.man_outlined, color: Colors.white70,
                size: 36,),
                label: 'PROFILE'
            ),
            NavigationDestination(
                icon:  Icon(Icons.add, color: Colors.white70,
                size: 36,),
                label: 'ADDSTOCK'
            ),
          ],
        ),
      ),

    );
  }
}
