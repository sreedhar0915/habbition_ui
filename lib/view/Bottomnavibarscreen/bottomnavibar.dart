import 'package:flutter/material.dart';
import 'package:habbition_ui/view/Cart_screen/Cart_screen.dart';
import 'package:habbition_ui/view/Category_screen/category_screen.dart';
import 'package:habbition_ui/view/Homescreen/Homescreen.dart';
import 'package:habbition_ui/view/Saved_screen/saved_screen.dart';

class Bottomnavibarscreen extends StatefulWidget {
  const Bottomnavibarscreen({super.key});

  @override
  State<Bottomnavibarscreen> createState() => _BottomnavibarscreenState();
}

class _BottomnavibarscreenState extends State<Bottomnavibarscreen> {
  int selectedtab = 0;
  final List<Widget> screens = [
    Homescreen(),
    CategoryScreen(),
    SavedScreen(),
    CartScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedtab],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedtab = index;
          });
        },
        currentIndex: selectedtab,
        backgroundColor: Color.fromRGBO(52, 161, 65, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/Vector.png"),
              icon: Image.asset("assets/images/Frame.png"),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/category (2) 1.png"),
              icon: Image.asset("assets/images/category (1) 1.png"),
              label: "Category"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/bookmark (4) 1.png"),
              icon: Image.asset("assets/images/bookmark (3) 1.png"),
              label: "Saved"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/grocery-store 1.png"),
              icon: Image.asset("assets/images/shopping-cart 1.png"),
              label: "Cart"),
        ]);
  }
}
