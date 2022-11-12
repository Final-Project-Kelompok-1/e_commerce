import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:e_commerce/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _header(),
            _register(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 320.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.mainColor, AppColor.thirdColor],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
      child: Center(
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _register() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppDimen.h40),
            SizedBox(height: AppDimen.h40),
            SizedBox(height: AppDimen.h40),
            SizedBox(height: AppDimen.h40),
            SizedBox(height: AppDimen.h40),
            SizedBox(height: AppDimen.h40),
            Container(
              height: 725.h,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimen.h10),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Text(
                          'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        )),
                    SizedBox(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Full Name',
                          ),
                          style: TextStyle(
                              fontSize: 30.0, height: 2.0, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimen.h10),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        )),
                    SizedBox(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the Email',
                          ),
                          style: TextStyle(
                              fontSize: 30.0, height: 2.0, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimen.h10),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        )),
                    SizedBox(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the phone number',
                          ),
                          style: TextStyle(
                              fontSize: 30.0, height: 2.0, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimen.h10),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        )),
                    SizedBox(
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                          child: TextField(
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                                hintText: 'Enter the password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    })),
                            style: TextStyle(
                                fontSize: 30.0,
                                height: 2.0,
                                color: Colors.black),
                          )),
                    ),
                    SizedBox(height: AppDimen.h10),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Text(
                          'Confirm password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        )),
                    SizedBox(
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                          child: TextField(
                            obscureText: _isObscureConfirm,
                            decoration: InputDecoration(
                                hintText: 'Enter the password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscureConfirm = !_isObscureConfirm;
                                      });
                                    })),
                            style: TextStyle(
                                fontSize: 30.0,
                                height: 2.0,
                                color: Colors.black),
                          )),
                    ),
                    SizedBox(height: AppDimen.h30),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          child: Column(children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  AppColor.mainColor,
                                  AppColor.thirdColor
                                ]),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.57),
                                      blurRadius: 5)
                                ]),
                            child: SizedBox(
                                width: 580,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      //make color or elevated button transparent
                                    ),
                                    onPressed: () {
                                      print("You pressed Elevated Button");
                                    },
                                    child: SizedBox(
                                      height: 80,
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 36.0,
                                          height: 2.0,
                                        ),
                                      ),
                                    ))))
                      ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                          ),
                        ),
                        Container(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Text(
                                "Already have an Account?",
                                style: TextStyle(
                                  fontSize: 28.0,
                                  height: 2.0,
                                ),
                              )),
                        ),
                        Container(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 28.0,
                              height: 2.0,
                              color: Color.fromARGB(255, 24, 218, 239)),
                        )),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
