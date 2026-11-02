// Answer in a comment at the top of login_page.dart:
// - What does super.key do? Where does the key go?

// super.key passes the key received by the widget constructor
// to the parent class (StatefulWidget or StatelessWidget).
// The key is used by Flutter to identify widgets in the widget tree.

// - What's the difference between the Key?
// key passed through super.key and the GlobalKey<FormState> (_keyForm) we use in the form?
// Key? key is used to identify a widget in the widget tree.
// GlobalKey<FormState> is used to access and control a FormState,
// such as validating the form using validate() to run each validator in each TextFormField.


//Why does const make Flutter faster?

// Const means values are known at compile time.
// Flutter can reuse these constant widget instances instead of
// creating new ones during rebuilds, reducing unnecessary work,useful for memory.


// What does the _ do in Dart, and why should State classes be private?

// In Dart, adding an underscore (_) makes a variable, method,
// or class private to its library (file) we can no access them out side its library.
// State classes should be private because they are implementation
// details and should not be accessed directly from other files.


// Explain the difference between go and push using the word stack.
// context.push() adds a new page on top of the current navigation
// stack, so we can return to the previous page using context.pop().

// context.go() navigates directly to a location and updates the
// route configuration. It does not work like simply pushing
// a new page onto the navigation stack. we can not using pop to return again

// Test 1:
// Using push() opens the Signup page on top of Login.
// Using pop() returns to the Login page.
// The Login page remains in the navigation stack.
// When using push("/signup"), the Signup page opens on top
// of the Login page.
//
// When using pop(), the app returns to Login.
//
// The Login page is not disposed when opening Signup,
// so "finish Login" does not appear in the console.

// Test 2:
// Using go("/signup") navigates directly to the Signup page.
// The Login page is disposed, and "finish Login" appears
// in the console.
//
// When using pop(), there is no previous Login page to return to,
// so navigation cannot return to Login as expected and raise error there There is nothing to pop

// Test 3:
// Using go() navigates directly to Signup.
// Using go() again navigates directly to Login.
// The Login page opens successfully.
//  start Login=> start signup=>  finish Login=> start Login=> finish signup this order appears in console

// Test 4:
// Using push() opens Signup above Login.
// Pressing the device back button or AppBar back arrow
// returns to the Login page.
// - With push, is Login disposed when you open Signup? no
// - With go, is Login disposed? yes

// The difference between go() and push():

// push() opens a new page on top of the current screen
// and adds it to the navigation stack.
// We can return to the previous page using pop().
//
// go() navigates directly to a new location and updates
// the route configuration. The previous page is not kept
// as a page to return to using pop().

// 5.4 Find the hidden bug
// Login goes to Home with context.go("/home"), but the "go back" button in Home calls context.pop().
// - Press it. What happens and why?
//  when press on "go back" button in Home this raise ExceptionThere is nothing to pop
// because we use go() to goback home screen from login ,and go() just updates route configuration
// ,does not add above screen in stack, The previous page is not kept as a page to return to using pop().
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _inputCheck() {
    if (_keyForm.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (username == Database.username && password == Database.password) {
        Database.isLoggedIn = true;
        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Wrong info")));
      }
    }
  }

  @override
  void initState() {
    print(" start Login");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    print(" finish Login");
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter valid username ";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (((value?.length) ?? 0) < 6) {
                    return "please enter valid password";
                  }
                  return null;
                },

                obscureText: true,
              ),
              ElevatedButton(
                onPressed: _inputCheck,

                //     () {
                //   // context.go("/home");
                //
                //   // context.push("/home");
                //   // context.go("/home/products");
                //   // context.push("/home/products");
                //   context.go("/home");
                // },
                child: const Text("go to home "),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      context.push("/signup");
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff8f3e4d),
                        fontFamily: "inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
