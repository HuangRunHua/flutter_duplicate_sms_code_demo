import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmsCodeField extends StatefulWidget {
  final InputDecoration? decoration;
  final TextStyle? style;

  SmsCodeField({super.key, this.decoration, this.style});

  @override
  State<SmsCodeField> createState() => _SmsCodeFieldState();
}

class _SmsCodeFieldState extends State<SmsCodeField> {
  final TextEditingController controller = TextEditingController();

  final int? length = 6;
  // expected SMS code length
  final TextInputType keyboardType = TextInputType.number;

  final TextAlignVertical? textAlignVertical = TextAlignVertical.center;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        debugPrint(controller.text);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textAlignVertical: textAlignVertical,
      // autofillHints: const [AutofillHints.oneTimeCode],
      inputFormatters: [
        // if (length != null) LengthLimitingTextInputFormatter(length),
        UpperCaseTextInputFormatter(),
      ],
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
        suffix: const SizedBox.shrink(),
        suffixIcon: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 100,
            minHeight: 60,
            maxHeight: 60,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child:
                    widget.decoration?.suffixIcon ?? widget.decoration?.suffix,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(body: Center(child: SmsCodeField())),
    ),
  );
}
