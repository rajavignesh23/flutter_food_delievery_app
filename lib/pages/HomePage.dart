import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food/animation/ScaleRoute.dart';
import 'package:flutter_food/pages/SignInPage.dart';
import 'package:flutter_food/widgets/BestFoodWidget.dart';
import 'package:flutter_food/widgets/BottomNavBarWidget.dart';
import 'package:flutter_food/widgets/PopularFoodsWidget.dart';
import 'package:flutter_food/widgets/SearchWidget.dart';
import 'package:flutter_food/widgets/TopMenus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        title: const Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {Navigator.push(context, ScaleRoute(page: const SignInPage()));})
        ], systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
