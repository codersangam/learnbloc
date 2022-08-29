import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class TfCustomWidgetsDemo extends StatefulWidget {
  const TfCustomWidgetsDemo({Key? key}) : super(key: key);

  @override
  State<TfCustomWidgetsDemo> createState() => _TfCustomWidgetsDemoState();
}

class _TfCustomWidgetsDemoState extends State<TfCustomWidgetsDemo> {
  @override
  Widget build(BuildContext context) {
    // WidgetUtils widgetUtils = WidgetUtils();
    // Color? mycolor = WidgetUtils.primaryColor = Colors.green;
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateTime.now()
              .subtract(Duration(days: 1))
              .timeAgo(useShortForm: true)
              .toString()
              .text
              .bold
              .make(),
          InkWell(
              onTap: () => VxDialog.showCustom(
                    context,
                    child: "This is a ticker".text.make(),
                  ),
              child: "hey".text.bold.make()),
          VxPopupMenu(
                  menuBuilder: () {
                    return Container(
                      child: VStack([Icon(Icons.chat)]),
                    );
                  },
                  clickType: VxClickType.singleClick,
                  child: "lol".text.xl4.make())
              .centered()
          // VxDialog.showAlert(context, title: "lol", onPressed: (){}),
          // DefaultButton(title: "lol2"),
          // Container(
          //   color: Colors.green,
          //   child: "lol".text.xl2.make(),
          // )
        ],
      )),
    );
  }
}
