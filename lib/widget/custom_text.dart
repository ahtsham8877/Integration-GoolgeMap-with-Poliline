import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? title1;
  final double? title1fontSize;
  final Color title1Color;
  final Widget? sizebox;
  final String? subtitle;
  final double? subtitlesize;
  final Color subtitleColor;
  final String? midtext;
  final double? midtextfontSize;
  final Color midtextColor;
  final String? midtext2;
  final double? midtextfontSize2;
  final Color? midtextColor2;
  final int? maxline;
  final FontWeight? title1fontWeight;
  final FontWeight? subtitleFontsWeight;
  final FontWeight? midtextfontWeight;
  final FontWeight? midtextfontWeight2;
  CustomText(
      {Key? key,
      this.title1,
      this.title1fontSize,
      this.maxline,
      this.title1Color = Colors.black,
      this.title1fontWeight,
      this.sizebox,
      this.subtitle,
      this.subtitlesize,
      this.subtitleColor = Colors.black,
      this.subtitleFontsWeight,
      this.midtext,
      this.midtextfontSize,
      this.midtextColor = Colors.black,
      this.midtext2,
      this.midtextfontSize2,
      this.midtextColor2,
      this.midtextfontWeight,
      this.midtextfontWeight2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title1 != null)
          Row(
            children: [
              Text(
                title1!,
                maxLines: maxline,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Chivo',
                  fontSize: title1fontSize,
                  color: title1Color,
                  fontWeight: title1fontWeight,
                ),
              ),
              if (sizebox != null) sizebox!,
              if (subtitle != null)
                Text(
                  subtitle!,
                  maxLines: maxline,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: subtitlesize,
                    color: subtitleColor,
                    fontWeight: subtitleFontsWeight,
                  ),
                ),
            ],
          ),
        if (midtext != null)
          Text(
            midtext!,
            style: TextStyle(
                fontSize: midtextfontSize,
                color: midtextColor,
                fontWeight: midtextfontWeight),
          ),
        if (midtext2 != null)
          Text(
            midtext2!,
            style: TextStyle(
                fontSize: midtextfontSize2,
                color: midtextColor2,
                fontWeight: midtextfontWeight2),
          ),
      ],
    );
  }
}
