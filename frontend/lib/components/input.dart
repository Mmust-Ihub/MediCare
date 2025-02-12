import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  final bool? isObscured;
  final String hintText;
  final Widget? prefixIcon;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  const InputComponent(
      {super.key,
      this.isObscured,
      required this.hintText,
      required this.controller,
      this.prefixIcon,
      this.keyboardType,
      this.isPassword});

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  late bool isObscured;
  late bool isPassword;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword ?? false;
    isPassword = widget.isPassword ?? false;
  }



  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: isObscured,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          contentPadding: const EdgeInsets.all(15),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  child: isObscured
                      ? Icon(Icons.visibility, color: Colors.grey.shade500)
                      : Icon(Icons.visibility_off, color: Colors.grey.shade500),
                )
              : null),
    );
  }
}
