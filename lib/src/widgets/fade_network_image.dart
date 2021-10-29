import 'package:componentes/src/widgets/my_assets.dart';
import 'package:flutter/material.dart';

class FadeNetworkImage extends StatelessWidget {
  final String image;
  const FadeNetworkImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage(MyAssets.jar_loading),
      image: NetworkImage(image),
    );
  }
}
