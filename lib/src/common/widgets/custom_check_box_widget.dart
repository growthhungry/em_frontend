import 'package:flutter/material.dart';

/// {@template custom_check_box_widget}
/// CustomCheckBoxWidget widget.
/// {@endtemplate}
class CustomCheckBoxWidget extends StatefulWidget {
  /// {@macro custom_check_box_widget}
  const CustomCheckBoxWidget(
      {super.key,
      required this.value,
      required this.title,
      required this.onPressed});

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();

  /// Responsible for handling clicks
  final bool value;

  /// Text after checkbox
  final String title;

  final VoidCallback onPressed;
}

/// State for widget CustomCheckBoxWidget.
class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {});
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: widget.value
                  ? Border.all(color: Colors.black, width: 2)
                  : Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
            ),
            child: widget.value
                ? const Center(
                    child: Icon(
                    Icons.check,
                    size: 17,
                  ))
                : const SizedBox(),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          widget.title,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontFamily: 'GoogleSans',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
