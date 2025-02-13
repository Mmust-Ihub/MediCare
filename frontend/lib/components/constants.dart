import 'package:flutter/material.dart';

var backgroundColor = Colors.grey[100];
var myAppBar = AppBar(
  backgroundColor: Colors.blue,
);

var patientDrawer = Drawer(
  backgroundColor: Colors.grey[200],
  child: const Column(children: [
    DrawerHeader(
      child: UserAccountsDrawerHeader(
          // currentAccountPicture: Icon(Icons.person),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          accountName: Text("Byrone Kingsly"),
          accountEmail: Text("Kinslybyrone17@gmail.com")),
    ),
    ListTile(
      leading: Icon(Icons.home),
      title: Text("Home"),
      selectedColor: Colors.blue,
      hoverColor: Colors.blue,
    ),
    ListTile(
      leading: Icon(Icons.stacked_bar_chart),
      title: Text("Records"),
      selectedColor: Colors.blue,
      hoverColor: Colors.blue,
    ),
    ListTile(
      leading: Icon(Icons.local_hospital_outlined),
      title: Text("Hospitals"),
      selectedColor: Colors.blue,
      hoverColor: Colors.blue,
    ),
    ListTile(
      leading: Icon(Icons.person),
      title: Text("Profile"),
      selectedColor: Colors.blue,
      hoverColor: Colors.blue,
    ),
  ]),
);

class Category {
  final String name;
  final Icon icon;

  Category({required this.name, required this.icon});
}

List<Category> hospitalCategories = [
  Category(
      name: "Cardiology",
      icon: const Icon(Icons.favorite, color: Colors.red, size: 50)),
  Category(
      name: "Neurology",
      icon: const Icon(Icons.psychology, color: Colors.blue, size: 50)),
  Category(
      name: "Orthopedics",
      icon: const Icon(Icons.accessibility, color: Colors.green, size: 50)),
  Category(
      name: "Pediatrics",
      icon: const Icon(Icons.child_care, color: Colors.orange, size: 50)),
];
