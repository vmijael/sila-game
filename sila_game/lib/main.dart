import 'package:flutter/material.dart';
import 'package:sila_game/src/sila_game_type.dart';
import 'package:sila_game/src/sila_main_game.dart';

class SilaRouteBuilder {
  final String route;
  final WidgetBuilder builder;

  SilaRouteBuilder({
    required this.route,
    required this.builder,
  });
}

final silaRoutes = [
  SilaRouteBuilder(
    route: '/sila_game_type',
    builder: (context) => const SilaGameType(),
  ),
  SilaRouteBuilder(
    route: 'sila_main_game',
    builder: (context) => const SilaMainGame(),
  )
];

void main() => runApp(SilaGame());

class SilaGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sila Game',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // TODO: Upgrade to navigation 2
      routes: Map.fromEntries(
          silaRoutes.map((sila) => MapEntry(sila.route, sila.builder))),
      home: Home(title: 'Sila Game'),
    );
  }
}

class Home extends StatelessWidget {
  final String title;

  Home({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Acceder'),
          onPressed: () {
            Navigator.pushNamed(context, '/sila_game_type');
          },
        ),
      ),
    );
  }
}
