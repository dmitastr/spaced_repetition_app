import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/features/home_page/presentation/body.dart';
import 'package:spaced_repetition_app/features/home_page/presentation/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: HomePageAppBar(),
    );
  }
}
