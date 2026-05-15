import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.onChange,
    required this.controller,
  });
  TextEditingController controller;
  void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.pw20),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: AppSize.pw16),

          hintText: "Search",
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r4),
            borderSide: BorderSide(width: 1, color: Color(0xFFD3D3D3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r4),
            borderSide: BorderSide(width: 1, color: Color(0xFFD3D3D3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r4),
            borderSide: BorderSide(width: 1, color: Color(0xFFD3D3D3)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.r4),
            borderSide: BorderSide(width: 1, color: Color(0xFFD3D3D3)),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Color(0xFFA0A0A0),
              size: AppSize.r30,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: AppSize.sp14,
            fontWeight: FontWeight.w400,
            color: Color(0xFFA0A0A0),
          ),
          fillColor: Colors.transparent,
          filled: true,
        ),
      ),
    );
  }
}
