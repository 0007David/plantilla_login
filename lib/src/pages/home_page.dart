import 'package:flutter/material.dart';

import 'bloc/provider.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Password: ${bloc.password}'),
        ],
      ),
      
    );
  }
}