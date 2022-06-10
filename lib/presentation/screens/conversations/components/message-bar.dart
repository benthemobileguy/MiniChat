import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class MessageBar extends StatelessWidget {
  const MessageBar({
    Key key,
    this.searchController,
    this.hintText,
    this.fillColor,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController searchController;
  final String hintText;
  final Function() onPressed;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                filled: true,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Nunito',
                  color: Colors.white,
                ),
                prefixIconConstraints: const BoxConstraints(
                    minHeight: 24,
                    minWidth: 24
                ),
                suffixIcon:
                SizedBox(
                  height: 40,
                  width: 40,
                  child: TextButton(
                    onPressed: onPressed,
                    child: SvgPicture.asset("assets/images/send.svg",
                        color:Colors.white),
                  ),
                ),
                hintText: hintText,
                fillColor: fillColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                )
            ),
          ),
        ),
      ],
    );
  }
}