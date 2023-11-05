import 'package:flutter/material.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';

class BeerCompositionTitleValue extends StatelessWidget {
  const BeerCompositionTitleValue({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.verticalSpacing,
  });
  final String title;
  final TextStyle? titleStyle;
  final double? verticalSpacing;
  final String value;
  final TextStyle? valueStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: titleStyle ?? TextStyleConstants.s12W500c1E2022,
        ),
        SizedBox(
          height: verticalSpacing ?? 0,
        ),
        Text(
          value,
          style: valueStyle ?? TextStyleConstants.s12W400c77838F,
        )
      ],
    );
  }
}
