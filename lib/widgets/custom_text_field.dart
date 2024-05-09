import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.controller,
    this.hintText,
    this.label,
    this.maxLine,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.isRequired,
    this.obsecureText,
    this.validatorFunctions,
    this.inputFormatters,
    this.onChange,
    this.onSubmit,
    this.isDense,
    this.contentPadding,
    this.inputTextStyle,
    this.hintStyle,
    this.textInputAction,
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? label;
  final int? maxLine;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool? isRequired;
  final bool? obsecureText;
  final List<String? Function(String value)?>? validatorFunctions;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChange;
  final void Function(String value)? onSubmit;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[Text(label ?? ''), SizedBox(height: 5.h)],
        TextFormField(
          obscureText: obsecureText ?? false,
          controller: controller,
          maxLines: maxLine,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          onChanged: (value) {
            onChange?.call(value);
          },
          onFieldSubmitted: (value) {
            onSubmit?.call(value);
          },
          validator: (value) {
            if (isRequired ?? false) {
              if (value == null || value.isEmpty) {
                return 'Field can\'t be empty';
              }
            }

            if (validatorFunctions != null) {
              for (String? Function(String value)? validatorFunction
                  in validatorFunctions!) {
                String? validateString = validatorFunction?.call(value!);
                if (validateString != null) {
                  return validateString;
                }
              }
            }

            return null;
          },
          style: inputTextStyle,
          decoration: InputDecoration(
            isDense: isDense ?? true,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            hintText: hintText,
            hintStyle: hintStyle,
            prefixIcon: prefix,
            suffixIcon: suffix,
            border: border ?? const OutlineInputBorder(),
            enabledBorder: enabledBorder ?? const OutlineInputBorder(),
            focusedBorder: focusedBorder ?? const OutlineInputBorder(),
            errorBorder: errorBorder ?? const OutlineInputBorder(),
            disabledBorder: disabledBorder ?? const OutlineInputBorder(),
            focusedErrorBorder:
                focusedErrorBorder ?? const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
