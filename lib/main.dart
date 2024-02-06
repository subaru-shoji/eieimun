import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MyHomePageBody(),
    );
  }
}

class MyHomePageBody extends StatelessWidget {
  MyHomePageBody() : super();

  void _incrementCounter(BuildContext context) {
    context.read<CounterCubit>().increment();
  }

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CounterCubit>().state;
    final message = getMessage(count);

    return Scaffold(
      appBar: AppBar(
        title: Text('えいえいむん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'マチカネタンホイザ',
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
