import 'package:flutter/material.dart';

class ReportsWidget extends StatefulWidget {
  @override
  _ReportsWidgetState createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _monthFocus = FocusNode();
  final _yearFocus = FocusNode();
  var _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      print('ok');
    } catch (error) {
      throw error;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_monthFocus);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Month'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _monthFocus,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_yearFocus);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                  focusNode: _yearFocus,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                FlatButton(
                  child: Text('Submit'),
                  onPressed: _submit,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
