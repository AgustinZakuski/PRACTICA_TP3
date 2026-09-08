
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/menu_item.dart';
import 'package:go_router/go_router.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            selectedIndex = index;
            setState(() {

            });
            Navigator.of(context).pop();
            context.go(menu[index].path);
          },
      
          children: 
          menu.map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          )).toList(),
    );
  }
}