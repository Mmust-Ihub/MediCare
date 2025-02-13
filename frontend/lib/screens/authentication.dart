import 'package:flutter/material.dart';
import 'package:medicare/components/login_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (contect, constraint) {
      return Scaffold(
        body: SafeArea(
          child: constraint.maxWidth < 426
              ? const SingleChildScrollView(child: LoginPage())
              : Row(children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/doctor_3.webp")),
                      ),
                      // color:Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const LoginPage()),
                  ),
                ]),
        ),
      );
    });
  }
}
