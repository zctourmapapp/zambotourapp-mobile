import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      this.controller,
      this.textInputType,
      this.iconData,
      this.hintText})
      : super(key: key);

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final IconData? iconData;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    RxBool obs = true.obs;
    if (hintText!.toLowerCase().contains('password')) {
      return Obx(
        () => TextFormField(
          obscureText: obs.value,
          controller: controller,
          keyboardType: textInputType ?? TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: Icon(iconData ?? Icons.text_fields),
              hintText: hintText,
              suffixIcon: IconButton(
                  onPressed: () {
                    obs.toggle();
                  },
                  icon: Icon(obs.isTrue
                      ? Icons.visibility_off_rounded
                      : Icons.visibility)),
              border: const UnderlineInputBorder()),
        ),
      );
    }

    return TextFormField(
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData ?? Icons.text_fields),
          hintText: hintText,
          border: const UnderlineInputBorder()),
    );
  }
}
