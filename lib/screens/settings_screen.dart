import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {

  static const String routName = 'Settings';
  
 const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  /*
  bool isDarkmode = false;
  int gender = 1;
  String name = 'Pedro';
  */

 @override
 Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       title: Text('Settings'),
       centerTitle: true,
     ),
     drawer: SideMenu(),
     body: Padding(
       padding: EdgeInsets.all(8.0),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),),
             const Divider(),

             SwitchListTile.adaptive(
               value: Preferences.isDarkmode, 
               title: Text('Darkmode'),
               onChanged: (value) {
                 Preferences.isDarkmode = value;
                 final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                 value 
                  ? themeProvider.setDarkMode() 
                  : themeProvider.setLightMode();

                 setState(() {});
               }
            ),

            const Divider(),
            RadioListTile<int>(
              value: 1, 
              groupValue: Preferences.gender, 
              title: Text('Masculino'),
              onChanged: (value) {
                Preferences.gender = value ?? 1;
                setState(() {});
              }
            ),

            const Divider(),
            RadioListTile<int>(
              value: 2, 
              groupValue: Preferences.gender, 
              title: Text('Femenino'),
              onChanged: (value) {
                Preferences.gender = value ?? 2;
                setState(() {});
              }
            ),

            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: ( value ) {
                  Preferences.name = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario'
                ),
              ),
            )
            
           ],
         ),
       ),
     )
    );
  }
}