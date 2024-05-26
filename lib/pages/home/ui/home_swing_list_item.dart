import 'package:flutter/material.dart';
import '../../../design/dimensions.dart';
import '../../../design/styles.dart';
import '../../../design/colors.dart';

class HomeSwingListItem extends StatelessWidget {
  final Function() onTap;
  final String swingName;

  const HomeSwingListItem({super.key, required this.onTap, required this.swingName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64,
          child: Card(
            color: backgroundColor,
            margin: EdgeInsets.zero,
            elevation: 0.06,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: padding16, right: padding16),
                child: Row(
                  children: <Widget>[
                    _swingInfo(swingName),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }

  Widget _swingInfo(String name) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: padding8, right: padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: primaryTextStyle),
          ],
        ),
      ),
    );
  }
}
