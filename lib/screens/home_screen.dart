import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  static const String routName = 'Home';
  
 const HomeScreen({Key? key}) : super(key: key);
 
 @override
 Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       title: Text('Home'),
       centerTitle: true,
     ),
     drawer: SideMenu(),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('isDarkmode: ${Preferences.isDarkmode}'),
         Divider(),
         Text('Genero: ${Preferences.gender}'),
         Divider(),
         Text('Nombre de usuario: ${Preferences.name}'),
         Divider(),
       ],
     ),
    );
  }
}