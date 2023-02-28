import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {Key? key,
      this.controller,
      this.icon,
      required this.hint,
      this.obscure = false,
      this.visibiliti,
      this.onChange,
      this.maxLine})
      : super(key: key);

  final TextEditingController? controller;
  final Widget? icon;
  final String hint;
  final bool obscure;
  final Widget? visibiliti;
  final ValueChanged? onChange;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: controller,
      onChanged: onChange,
      minLines: 1,
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Color(0xffBDBDBD)),
        prefixIcon: icon,
        prefixIconColor: const Color(0xff767475),
        suffixIcon: visibiliti,
        suffixIconColor: const Color(0xff767475),
        hintText: hint,

        fillColor: const Color(0xffFAFAFA),
        filled: true,
        focusColor: const Color(0xff767475),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffEEEEEE),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffEEEEEE),
            width: 2.0,
          ),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: const BorderSide(
        //     color: Color(0xff767475),
        //     width: 2.0,
        //   ),
        // ),
      ),
    );
  }
}
