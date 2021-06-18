import 'package:flutter/material.dart';
import '../widgets/reports_widget.dart';
import '../widgets/company_grid.dart';

class CompanyHomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syscomod'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                height: 70,
                child: CompanyGrid()
              ),
              elevation: 8.0,
            ),
            Card(
              elevation: 8.0,
              child: ReportsWidget()
            )
          ],
          ),
      ),
    );
  }
}

