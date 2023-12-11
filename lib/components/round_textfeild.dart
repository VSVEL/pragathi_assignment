import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RoundedTextField extends StatefulWidget {
  RoundedTextField(
      {Key key,
        this.rcontroller,
        this.rhintText,
        this.isObsecure = false})
      : super(key: key);

   TextEditingController rcontroller;
 String rhintText;
  bool isObsecure;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.rcontroller,
          obscureText: widget.isObsecure,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: InputBorder.none,
            hintText: widget.rhintText,
          ),
        ),
      ),
    );
  }
}
