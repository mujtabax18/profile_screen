import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({
    Key? key,
    required this.backFunctionButtonAction,
    required this.editFunctionButtonAction,
    this.showedit: true,
  }) : super(key: key);
  final Function backFunctionButtonAction;
  final Function editFunctionButtonAction;
  final bool showedit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => backFunctionButtonAction(),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
                size: 25,
              )),
          Visibility(
            visible: showedit,
            child: IconButton(
                onPressed: () => editFunctionButtonAction(),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 25,
                )),
          ),
        ],
      ),
    );
  }
}
