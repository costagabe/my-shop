import 'package:flutter/material.dart';

class SimplePageLayout extends StatelessWidget {
  final Widget _body;

  SimplePageLayout(this._body);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: _body
      ),
    );
  }
}
