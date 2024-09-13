import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Core/utils/styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({String? title, void Function()? onTapOnLeading}) {
  return AppBar(
    title: Text(title ?? "", style: Styless.style25),
    centerTitle: true,
    leading: InkWell(
        onTap: onTapOnLeading,
        child: Center(child: SvgPicture.asset(AppImages.imagesArrowBack))),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(color: Colors.transparent),
    ),
  );
}
