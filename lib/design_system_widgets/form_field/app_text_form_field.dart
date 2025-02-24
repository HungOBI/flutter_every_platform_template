import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends FormField<String> {
  final TextEditingController? textEditingController;

  AppTextFormField({
    bool usePhone = false,
    String? value,
    FocusNode? focusNode,
    Key? key,
    String? initialValue,
    String? title,
    String? labelText,
    Widget? action,
    String? hint,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool selected = false,
    bool readOnly = false,
    Widget? suffix,
    Widget? typingSuffix,
    Widget? icon,
    Widget? prefix,
    bool filled = false,
    AutovalidateMode? autovalidateMode,
    this.textEditingController,
    bool isPassword = false,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    int? maxLine,
    onTap,
    bool myAutoValidate = false,
    bool alwaysValidate = false,
    ValueChanged<String>? onChanged,
    int? minLines,
    bool? autoFocus,
    TextStyle? hintStyle,
  }) : super(
            key: key,
            validator: validator,
            onSaved: onSaved,
            initialValue: initialValue,
            autovalidateMode: alwaysValidate
                ? AutovalidateMode.always
                : myAutoValidate
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
            builder: (FormFieldState field) {
              AppTextFormFieldState state = field as AppTextFormFieldState;
              return TextField(
                key: key,
                focusNode: focusNode,
                readOnly: readOnly,
                minLines: minLines ?? 1,
                maxLines: maxLine ?? 1,
                autofocus: autoFocus ?? false,
                cursorColor: Colors.black,
                controller: state.textEditingController,
                keyboardType: inputType,
                inputFormatters: inputFormatters,
                maxLength: maxLength,
                onChanged: (text) {
                  state.didChange(text);
                  if (onChanged != null) {
                    onChanged(text);
                  }
                },
                decoration: const InputDecoration()
                    .applyDefaults(Theme.of(state.context).inputDecorationTheme)
                    .copyWith(
                      fillColor: readOnly ? const Color(0xffF2F2F2) : null,
                      hintText: hint,
                      hintStyle: hintStyle,
                      labelText: labelText,
                      suffixIcon: state.value != null && state.value!.isNotEmpty
                          ? (typingSuffix ?? suffix)
                          : suffix,
                      errorText: state.errorText,
                      enabled: enabled,
                      counter: const Text(''),
                      prefixIcon: prefix,
                    ),
              );
            });

  @override
  AppTextFormFieldState createState() => AppTextFormFieldState();
}

class AppTextFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  @override
  AppTextFormField get widget => super.widget as AppTextFormField;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.textEditingController ??
        TextEditingController(text: widget.initialValue);
  }
}
