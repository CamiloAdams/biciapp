import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Iniciar sesión",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding * 2),
        // Row(
        //   children: [
        //     const Spacer(),
        //     Expanded(
        //       flex: 1,
        //       child: SvgPicture.asset("assets/icons/icon_grande.svg"),
        //     ),
        //     const Spacer(),
        //   ],
        // ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
