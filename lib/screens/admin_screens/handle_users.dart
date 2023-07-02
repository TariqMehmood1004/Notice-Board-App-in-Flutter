// ignore_for_file: use_build_context_synchronously
import 'package:app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Widgets/constents/firebase_services.dart';

class HandleUserAuth extends StatefulWidget {
  const HandleUserAuth({super.key});

  @override
  State<HandleUserAuth> createState() => _SignUpControllerState();
}

class _SignUpControllerState extends State<HandleUserAuth> {

  final _userRoleController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseService firebaseService = FirebaseService();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  void showSnackBar({String msg = "message"}) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.snackBarBGColor3,
      content: Text('Yay! ${msg.toString()}', style: TextStyle(color: AppColors.white),),
      action: SnackBarAction(
        label: 'Ok',
        textColor: AppColors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  //
  // createUser() async {
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();
  //   String userRoll = _userNameController.text.trim();
  //   String confirmPassword = _confirmPasswordController.text.trim();
  //
  //   try {
  //     if(email == "" || password == "" || confirmPassword == "" || userRoll == "")
  //     {
  //       showSnackBar(msg: "Please fill all the required fields.");
  //     }
  //     else if(password != confirmPassword)
  //     {
  //       debugPrint("Passwords do not match!");
  //       showSnackBar(msg: "Passwords do not match!");
  //     } else {
  //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  //       User? user = userCredential.user;
  //
  //       // Save user information to Firestore collection
  //       await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
  //         'userRole': _userNameController.text.trim(),
  //         'email': _emailController.text.trim(),
  //
  //         /*
  //         "uid": "user_uid",          // Unique identifier for the user
  //         "name": "John Doe",         // User's display name
  //         "email": "johndoe@example.com",   // User's email address
  //         "blocked": false,           // Boolean field indicating if the user is blocked or not
  //         "friends": [],              // Array field to store the user's friends' UIDs
  //         "createdAt": Timestamp,     // Timestamp indicating when the user was created
  //         // ... additional fields based on your app's requirements
  //       }
  //       */
  //       });
  //
  //       showSnackBar(msg: "User created successfully.");
  //     }
  //   }
  //   on FirebaseAuthException catch(e){
  //     showSnackBar(msg: e.code.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        backgroundColor: AppColors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create new account".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 0.87,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextField(
                            controller: _userRoleController,
                            decoration: InputDecoration(
                              labelText: "User Role",
                              icon: const Icon(Icons.verified_user),
                              iconColor: AppColors.primary,
                              labelStyle: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12.0, fontWeight: FontWeight.w300,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 15.0),
                          TextField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              labelText: "User Name",
                              icon: const Icon(Icons.verified_user),
                              iconColor: AppColors.primary,
                              labelStyle: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12.0, fontWeight: FontWeight.w300,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 15.0),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              icon: const Icon(Icons.email),
                              iconColor: AppColors.primary,
                              labelStyle: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12.0, fontWeight: FontWeight.w300,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 15.0),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              icon: const Icon(Icons.lock),
                              iconColor: AppColors.primary,
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 15.0),
                          InkWell(
                            onTap: () {

                              firebaseService.registerUserAccount(
                                  context,
                                  _userRoleController.text.trim(),
                                  _userNameController.text.trim(),
                                  _emailController.text.trim(),
                                  _passwordController.text.trim()
                              );
                            },
                            child: Ink(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 150,
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Icon(Icons.login, color: AppColors.primary,),
                                    Text("Create an Account", style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
