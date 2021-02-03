// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverHawks',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverhawks'),
          backgroundColor: Colors.amber[600],
        ),
        body: Center(
          child: Image.network(
              'https://thewvupchronicle.files.wordpress.com/2017/08/riverhawkbluecopy-copy.jpg'),
        ),
      ),
    );
  }
}
