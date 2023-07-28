import 'package:collegedoors_demo/dashboard.dart';
import 'package:collegedoors_demo/ragister_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool passToggle = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: email,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          email.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: password,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          password.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue.shade900,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            // signIn(email.text, password.text);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Form(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 26,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              radius: 25,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Hi, Please login to your Account",
                              style: TextStyle(
                                  fontFamily: 'Poppins-Bold',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black45),
                            ),
                          ),
                          const SizedBox(height: 45),
                          emailField,
                          const SizedBox(height: 25),
                          passwordField,
                          const SizedBox(height: 35),
                          loginButton,
                          const SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("Don't have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage()));
                                  },
                                  child: const Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                )
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  ////Firebase integration
  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //                 Fluttertoast.showToast(msg: "Login Successful"),
  //                 Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                     builder: (context) => const HomeScreen())),
  //               });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid-email":
  //           errorMessage = "Your email address appears to be malformed.";
  //
  //           break;
  //         case "wrong-password":
  //           errorMessage = "Your password is wrong.";
  //           break;
  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }
}
