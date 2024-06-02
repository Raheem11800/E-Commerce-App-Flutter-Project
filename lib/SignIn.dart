import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Main Screen.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignInState();
  }
}

class SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = "", password = "";
  bool _obscureText = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "* Email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 11),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: "* Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 11),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  suffix: GestureDetector(
                    onTap: showData,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            _loading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: login,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveData() {
    email = emailController.text;
    password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      errormsg("Please fill all fields");
      return;
    }
  }

  void showData() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void login() {
    saveData();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    setState(() {
      _loading = true;
    });

    _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      ).then((_) {
        setState(() {
          _loading = false;
        });
        successMsg("Login successful"); // Show success message
      });
    }).catchError((error) {
      debugPrint(error.toString());
      errormsg("Invalid email or password");
      setState(() {
        _loading = false;
      });
    });
  }

  void successMsg(String s) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Success"),
        content: Text(s),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void errormsg(String s) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(s),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
