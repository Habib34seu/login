import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './provider/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
         value: Auth(),
         )
      ],
        child:Consumer<Auth>(
          builder: (ctx, auth,_)=>MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: auth.isAuth ?  HomeScreen() : AuthScreen(),
            routes: {
              HomeScreen.routeName:(ctx)=>HomeScreen(),
            },
          ),
        ) ,
    );
  }
}

// auth.isAuth ?  HomeScreen() : 

