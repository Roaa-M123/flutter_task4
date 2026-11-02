import 'package:flutter/material.dart' ;
import 'package:full_shopping_app_4/test.dart';
import 'package:go_router/go_router.dart';
class HomePage extends StatefulWidget{

  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState() ;
  }
}

class _HomePageState extends State<HomePage>{


  @override
  void initState() {
    print(" start Home");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    print(" finish Home");
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(
          children: [
           const Text("welcome to Home Page"),
            ElevatedButton(onPressed: (){
              // context.pop() ;
              Database.isLoggedIn = false;
              context.go('/login');
            }, child: const Text("go back"))
          ],
        ),
      ),
    );
  }
}