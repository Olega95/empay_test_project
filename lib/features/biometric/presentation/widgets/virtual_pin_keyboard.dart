import 'package:empay_test_project/core/utils/extensions.dart';
import 'package:empay_test_project/core/utils/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class VirtualPinKeyboard extends StatefulWidget {
  const VirtualPinKeyboard({
    super.key,
    required this.controller,
    required this.biometricType,
    required this.onTapBiometric,
    required this.isFailure,
  });

  final TextEditingController controller;
  final BiometricType biometricType;
  final VoidCallback onTapBiometric;
  final bool isFailure;

  @override
  State<VirtualPinKeyboard> createState() => _VirtualPinKeyboardState();
}

class _VirtualPinKeyboardState extends State<VirtualPinKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 70,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 146,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: widget.isFailure
                            ? Colors.red
                            : widget.controller.text.isNotEmpty
                                ? Colors.deepPurple
                                : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: widget.isFailure
                            ? Colors.red
                            : widget.controller.text.length > 1
                                ? Colors.deepPurple
                                : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: widget.isFailure
                            ? Colors.red
                            : widget.controller.text.length > 2
                                ? Colors.deepPurple
                                : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: widget.isFailure
                            ? Colors.red
                            : widget.controller.text.length > 3
                                ? Colors.deepPurple
                                : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.isFailure)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    'Password mismatch',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          width: context.width * 0.7,
          child: Wrap(
            alignment: WrapAlignment.end,
            children: List.generate(
              12,
              (index) {
                if (index == 10) {
                  return InkResponse(
                    splashColor: Colors.transparent,
                    onTap: () {
                      widget.controller.text = '${widget.controller.text}0';
                    },
                    child: SizedBox(
                      height: (context.width * 0.7) / 3,
                      width: (context.width * 0.7) / 3,
                      child: const Center(
                        child: Text(
                          '0',
                        ),
                      ),
                    ),
                  );
                }

                if (index == 9) {
                  return InkResponse(
                    splashColor: Colors.transparent,
                    onTap: () {
                      widget.onTapBiometric();
                    },
                    child: SizedBox(
                      height: (context.width * 0.7) / 3,
                      width: (context.width * 0.7) / 3,
                      child: Center(
                        child: widget.biometricType == BiometricType.fingerprint
                            ? Assets.icons.fingerprint.svg()
                            : Assets.icons.faceId.svg(),
                      ),
                    ),
                  );
                }

                if (index == 11) {
                  return InkResponse(
                    splashColor: Colors.transparent,
                    onTap: () {
                      widget.controller.clear();
                    },
                    child: SizedBox(
                      height: (context.width * 0.7) / 3,
                      width: (context.width * 0.7) / 3,
                      child: const Center(
                        child: Text(
                          'C',
                        ),
                      ),
                    ),
                  );
                }

                return InkResponse(
                  splashColor: Colors.transparent,
                  onTap: () {
                    widget.controller.text =
                        '${widget.controller.text}${index + 1}';
                  },
                  child: SizedBox(
                    height: (context.width * 0.7) / 3,
                    width: (context.width * 0.7) / 3,
                    child: Center(
                      child: Text(
                        '${index + 1}',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
