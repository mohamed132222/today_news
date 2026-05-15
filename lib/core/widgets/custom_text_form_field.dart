import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/theme/light_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  TextEditingController controller = TextEditingController();
  final Function(String?)? validator;
  final String hintText;
  int? maxline;
  IconButton? suffixIcon;
  bool isObscure;
  TextInputType textInputType;
  CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    required this.hintText,
    this.maxline = 1,
    this.suffixIcon,
    this.isObscure = false,
    this.textInputType = TextInputType.text,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: AppSize.sp16,
            fontWeight: FontWeight.w400,
            color: LightColor.blackColor,
          ),
        ),
        SizedBox(height: AppSize.ph8),
        TextFormField(
          maxLines: widget.maxline,
          validator: (value) =>
              widget.validator != null ? widget.validator!(value) : null,
          controller: widget.controller,
          obscureText: widget.isObscure && _isVisible,
          style: TextStyle(
            fontSize: AppSize.sp16,
            fontWeight: FontWeight.w400,
            color: LightColor.blackColor,
          ),
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            //obscure for add icon in field visible for show data or not
            suffixIcon: widget.isObscure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
