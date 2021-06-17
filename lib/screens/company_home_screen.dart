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
      body: CompanyGrid(),
    );
  }
}

