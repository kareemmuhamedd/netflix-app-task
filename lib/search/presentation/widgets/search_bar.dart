import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.prefixIcon,
    this.keyboardType,
    this.onEditingComplete,
    this.controller,
    this.hintText,
    this.focusNode,
    this.initialValue,
    this.radius,
  });

  final String? hintText;
  final double? radius;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a valid value";
        } else {
          return null;
        }
      },
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        prefixIcon: prefixIcon ??
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
        isDense: true,
        contentPadding: const EdgeInsets.all(6),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 12),
          ),
        ),
      ),
    );
  }
}