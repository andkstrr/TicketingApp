import "package:flutter/material.dart";
import 'landing.dart';

void main() => runApp(MaterialApp(
  home: TicketingApp(),
));

class TicketingApp extends StatelessWidget {
  const TicketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ticket App",
      home: LandingPage()
    );
  }
}