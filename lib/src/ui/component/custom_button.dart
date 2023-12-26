import 'package:flutter/material.dart';

class CompCustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedCallback;

  const CompCustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.purple;
              }
              return Color(0xffDDBFED);
            }),
            side: MaterialStateProperty.resolveWith<BorderSide>((states) {
              return BorderSide(
                color: Color(0xffDDBFED),
                width: 2.0,
              );
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: onPressedCallback,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
