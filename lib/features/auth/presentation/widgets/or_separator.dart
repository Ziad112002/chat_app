import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/extensions/double_extension.dart';
import '../../../../core/utils/theme/app_color.dart';
import '../../../../core/utils/theme/app_text_style.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
              color: AppColor.grey,
            )),
        (context.width * .042).horizontalSpace(),
        Text(
          "OR",
          style: AppTextStyle.grey14BookCircular,
        ),
        (context.width * .042).horizontalSpace(),
        Expanded(
            child: Divider(
              color: AppColor.grey,
            )),
      ],
    );
  }
}
