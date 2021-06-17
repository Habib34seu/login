import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/companies.dart';

class CompanyGrid extends StatefulWidget {
  @override
  _CompanyGridState createState() => _CompanyGridState();
}

class _CompanyGridState extends State<CompanyGrid> {
  var _isInit = false;
  bool _isLoading = false;
  var _companies = [];

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      _isInit = true;

      setState(() {
        _isLoading = true;
      });

      Provider.of<Companies>(context, listen: false)
          .fetchAndSetCompanies()
          .then((value) {
        setState(() {
          _isLoading = false;
          _companies = Provider.of<Companies>(context, listen: false).companies;
        });
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text(
                _companies[0]['nombre'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
