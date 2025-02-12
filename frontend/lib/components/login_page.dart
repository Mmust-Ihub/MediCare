// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:medicare/components/input.dart';
import 'package:medicare/layout/hospital/hospital.dart';
import 'package:medicare/layout/patient/patient.dart';
import 'package:medicare/provider/providers.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: Colors.blue.withOpacity(0.1),
      child: Consumer<Providers>(
        builder: (BuildContext context, Providers value, Widget? child) {
          value.isLoading
              ? context.loaderOverlay.show()
              : context.loaderOverlay.hide();

          final Providers provider = context.read<Providers>();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                height: 270,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 215,
                        width: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.webp'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        "Login To Your Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
              const SizedBox(height: 30),
              InputComponent(
                hintText: 'Email',
                controller: email,
              ),
              const SizedBox(height: 20),
              InputComponent(
                hintText: 'Password',
                isPassword: true,
                controller: password,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 5,
                  ),
                  Text('Or Continue With'),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 5,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/facebook.webp'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text("Facebook")
                          ]),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/google.webp'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text("Google")
                          ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF53E88B),
                      Color(0xFF15BE77),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (email.text.trim().isEmpty ||
                        password.text.trim().isEmpty) return;
                    UserType? usertype = await provider.auth(email.text);

                    if (usertype == null) return;

                    if (usertype == UserType.hospital) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Hospital()),
                      );
                    } else if (usertype == UserType.patient) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Patient()),
                      );
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     maintainState: false,
                  //     builder: (context) => const SignupPage()));
                },
                child: const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
