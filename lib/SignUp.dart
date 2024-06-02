import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_03/SignIn.dart'; // Import your Profile widget

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController cnfrmpasscontroller = TextEditingController();
  String email = "" ,username = "";
  int pass = 0, cnfrmpass = 0;
  bool _obscureText = true;
  bool _loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 55), // Add space above the first text field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: usernamecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 11),
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 12), // Add space between the text fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: emailcontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 11),
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 12), // Add space between the text fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: passcontroller,
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 11),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  suffix: GestureDetector(
                    onTap: showData,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.remove_red_eye_outlined, color: Colors.black, size: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12), // Add space between the text fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: cnfrmpasscontroller,
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 11),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  suffix: GestureDetector(
                    onTap: showData,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.remove_red_eye_outlined, color: Colors.black, size: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            _loading ? CircularProgressIndicator() :
            ElevatedButton(
              onPressed: () {
                saveData();
                if (email.isNotEmpty && username.isNotEmpty && pass == cnfrmpass) {
                  setState(() {
                    _loading = true;
                  });
                  saveData().then((_) {
                    _auth.createUserWithEmailAndPassword(
                      email: email.toString(),
                      password: pass.toString(),
                    ).then((value) {
                      Errormsg(value.toString());
                      setState(() {
                        _loading = false;
                      });
                    }).catchError((error, stackTrace) {
                      debugPrint(error.toString());
                      Errormsg(error.toString());
                      setState(() {
                        _loading = false;
                      });
                    });
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill in all fields and make sure passwords match."),
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
              },


              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 140,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Already have an account? Sign In",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Future <void> saveData()async {
     email = emailcontroller.text;
     pass = int.parse(passcontroller.text);
     cnfrmpass = int.parse(cnfrmpasscontroller.text);
     username = usernamecontroller.text;

    // Add your logic to save the data
  }

  void showData() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void Errormsg(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.redAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}
