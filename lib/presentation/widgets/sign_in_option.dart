import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';

class SignInOption extends StatelessWidget {
  const SignInOption({
    super.key,
    required this.image,
    required this.onTap,
    required this.signInType,
    required this.color,
    this.textStyle,
  });
  final String image;
  final String signInType;
  final Color color;
  final Function() onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 80,
              ),
              SvgPicture.asset(
                image,
                width: 49,
                height: 49,
              ),
              const SizedBox(
                width: 31,
              ),
              Flexible(
                child: Text(
                  signInType,
                  style: textStyle ?? TextStyleConstants.s16W700cFFFFFF,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
