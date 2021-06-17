import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './provider/auth.dart';
import './screens/company_home_screen.dart';
import './provider/companies.dart';
import './provider/company.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
         value: Auth(),
         ),
        //  ChangeNotifierProvider(
        //  create: (ctx)=>Companies(),
        //  ),
         ChangeNotifierProxyProvider<Auth, Companies>(
         update:(ctx, auth,prevComp) =>Companies(auth.getToken, prevComp == null ? []: prevComp.companies),
         ),
        
      ],
        child:Consumer<Auth>(
          builder: (ctx, auth,_)=>MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: auth.isAuth ?  CompanyHomeScreen() : AuthScreen(),
            routes: {
              CompanyHomeScreen.routeName:(ctx)=>CompanyHomeScreen(),
            },
          ),
        ) ,
    );
  }
} 

