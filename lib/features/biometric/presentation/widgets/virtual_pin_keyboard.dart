import 'package:empay_test_project/core/utils/gen/assets.gen.dart';
import 'package:empay_test_project/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class VirtualPinKeyboard extends StatelessWidget {
  const VirtualPinKeyboard({
    super.key,
    required TextEditingController controller,
    required this.biometricType,
    required this.onTapBiometric,
  }) : _controller = controller;

  final TextEditingController _controller;
  final BiometricType biometricType;
  final VoidCallback onTapBiometric;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  _controller.text = '${_controller.text}0';
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
                  onTapBiometric();
                },
                child: SizedBox(
                  height: (context.width * 0.7) / 3,
                  width: (context.width * 0.7) / 3,
                  child: Center(
                    child: Assets.icons.fingerprint.svg(),
                  ),
                ),
              );
            }

            if (index == 11) {
              return InkResponse(
                splashColor: Colors.transparent,
                onTap: () {
                  _controller.clear();
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
                _controller.text = '${_controller.text}${index + 1}';
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
    );
  }
}
