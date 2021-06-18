import 'package:flutter/material.dart';
import '../widgets/company_grid.dart';

class CompanyHomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syscomod'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: CompanyGrid()
          ),
          Card(
            child: Text('Hello')
          )
        ],
        ),
    );
  }
}

