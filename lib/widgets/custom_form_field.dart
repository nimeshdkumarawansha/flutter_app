
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? inputType;
  final Function? suffixCallback;
  final Function? pickFromContact;
  final bool isObsucure;
  final bool isEnabled;
  final bool prefixEnable;
  final bool pickFromContactEnable;
  final bool suffixEnable;
  final String? prefixText;
  final Icon? suffixIcon;
  final int? maxLength;
  final String? regX;
  final EdgeInsetsGeometry? margin;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final EdgeInsetsGeometry? padding;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double paddingTop;
  final double? height;
  final Alignment alignment;
  final double? suffixMargin;
  final List<TextInputFormatter>? textInputFormatter;
  final Function? onChange;
  final TextCapitalization? textCapitalization;

  const CustomFormField({
    Key? key,
    required this.controller,
    this.isEnabled = false,
    this.prefixEnable = false,
    this.suffixEnable = false,
    this.pickFromContactEnable = false,
    this.isObsucure = false,
    this.hintText,
    this.suffixIcon,
    this.inputType,
    this.suffixCallback,
    this.maxLength,
    this.pickFromContact,
    this.regX,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.alignment = Alignment.centerLeft,
    this.margin,
    this.padding,
    this.suffixMargin = 0,
    this.height = 50,
    this.textInputFormatter,
    this.onChange,
    this.textCapitalization,
    this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!,
      alignment: alignment,
      margin: margin ??
          EdgeInsets.fromLTRB(
            marginLeft,
            marginTop,
            marginRight,
            marginBottom,
          ),
      padding: padding ??
          EdgeInsets.fromLTRB(
            paddingLeft,
            paddingTop,
            paddingRight,
            paddingBottom,
          ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: isObsucure,
              onChanged: (value) {
                if (onChange != null) {
                  onChange!(value);
                }
              },
              maxLength: maxLength,
              readOnly: isEnabled,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText ?? "",
                hintStyle: const TextStyle(
                  fontSize: 13.0,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: greyLightColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(color: greyLightColor, width: 1.5),
                ),
                fillColor: Colors.transparent,
                suffixIcon: (suffixEnable)
                    ? GestureDetector(
                        onTap: () {
                          if (suffixCallback != null) {
                            suffixCallback!();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                          margin: EdgeInsets.all(suffixMargin!),
                          child: SizedBox(
                              width: 7.5,
                              height: 7.5,
                              child: suffixIcon!,
                              // Image.asset(suffixUrl!),
                               ),
                        ),
                      )
                    : null,
                prefixIcon: (prefixEnable)
                    ? Container(
                        height: 42.5,
                        margin: const EdgeInsets.only(right: 15),
                        width: 115,
                        decoration: const BoxDecoration(
                          color: greyLightColor,
                          borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(8)),
                        ),
                        child: CountryCodePicker(
                          
                          onChanged: (CountryCode countryCode) {
                            // this.phoneNumber = countryCode.toString();
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'GH',
                         // favorite: ['+39', 'FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ))
                    : null,
                contentPadding: (prefixEnable)
                    ? const EdgeInsets.only(left: 15, top: 0, right: 0)
                    : const EdgeInsets.only(left: 25, top: 0, right: 0),
                border: OutlineInputBorder(
                  borderRadius: (pickFromContactEnable)
                      ? const BorderRadius.horizontal(left: Radius.circular(8))
                      : BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: inputType ?? TextInputType.text,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
