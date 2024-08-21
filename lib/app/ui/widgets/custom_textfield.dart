import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';
import '../../../config/constant/font_constant.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? prefixIcon;
  final String? name;
  final String? validationMsg;
  final int? maxLines;
  final bool formSubmitted;
  final TextEditingController? confirmPasswordController;

  const CustomTextFormField(
      {Key? key,
      this.ctrl,
      this.hintText,
      this.keyboardType,
      this.prefixIcon,
      this.maxLines,
      this.formSubmitted = false,
      this.name,
      this.confirmPasswordController,
      this.validationMsg})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isTouched = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  String? validateInput(String? value) {
    if (isTouched || widget.formSubmitted) {
      if (value != null && value.isNotEmpty) {
        if (widget.name == 'email') {
          const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);
          if (!regExp.hasMatch(value)) {
            return "Please enter a valid email";
          }
        }
        if (widget.name == "confirmpassword") {
          if (widget.ctrl?.text != widget.confirmPasswordController?.text) {
            return 'Confirm Password do not match';
          }
        }
        return null;
      }
      return widget.validationMsg;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kPrimaryColor, fontSize: 16),
      controller: widget.ctrl,
      keyboardType: widget.keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return validateInput(value);
      },
      obscureText: widget.name == "password" ? !_passwordVisible : false,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.name == "create" ? kWhiteColor : kTransparentColor,
        contentPadding:
            EdgeInsets.fromLTRB(13, widget.maxLines == 5 ? 16 : 0, 10, 0),
        hintStyle: TextStyle(
            color: widget.name == "create"
                ? widget.hintText == "Describe you request"
                    ? kSecondaryPrimaryColor
                    : kPrimaryColor
                : kSecondaryPrimaryColor,
            fontFamily: kCircularStdNormal, //Describe you request
            fontWeight: FontWeight.w400,
            fontSize: widget.name == "password"
                ? 16
                : widget.name == "create"
                    ? 14
                    : 16),
        prefixIcon: widget.prefixIcon != null
            ? Image.asset(
                widget.prefixIcon.toString(),
                color: kPrimaryColor,
                scale: widget.name == "firstUser"
                    ? 11
                    : widget.name == "phoneno"
                        ? 11
                        : 1.5,
              )
            : null,
        suffixIcon: widget.name == "password"
            ? IconButton(
                splashColor: kTransparentColor,
                highlightColor: kTransparentColor,
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: kSecondaryPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.name == "create" ? kWhiteColor : kErrorColor,
          ),
          borderRadius:
              BorderRadius.circular(widget.name == "create" ? 25 : 25.0),
        ),
        errorStyle: const TextStyle(color: kErrorColor),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.name == "create" ? 25 : 25.0),
          borderSide: BorderSide(
              color: widget.name == "create"
                  ? kWhiteColor
                  : kSecondaryPrimaryColor,
              width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.name == "create" ? 25 : 25.0),
          borderSide: BorderSide(
              color: widget.name == "create"
                  ? kWhiteColor
                  : kSecondaryPrimaryColor),
        ),
      ),
      maxLines: widget.maxLines,
      onChanged: (value) => {
        isTouched = true,
      },
    );
  }
}
