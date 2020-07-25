import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/eventhandler/click_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jsonwidget/resources/colors.dart';

class RefyneSamplePage extends StatefulWidget {
  final String jsonString;

  RefyneSamplePage(this.jsonString);

  @override
  State<StatefulWidget> createState() => _RefynePageState();
}

class _RefynePageState extends State<RefyneSamplePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.PRIMARY_DARK.color,
    ));
    return Scaffold(
      backgroundColor: AppColor.SNOW_WHITE.color,
      body: FutureBuilder<Widget>(
        future: _buildWidget(context),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? SafeArea(child: snapshot.data)
              : Text("Loading...");
        },
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.SNOW_WHITE.color,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
            color: AppColor.PRIMARY.color,
            size: 24,
          ),
          title: Text(''),
          activeIcon: Icon(
            Icons.map,
            color: AppColor.PRIMARY_DARK.color,
            size: 36,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColor.PRIMARY.color,
            size: 24,
          ),
          title: Text(''),
          activeIcon: Icon(
            Icons.home,
            color: AppColor.PRIMARY_DARK.color,
            size: 36,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info,
            color: AppColor.PRIMARY.color,
            size: 24,
          ),
          title: Text(''),
          activeIcon: Icon(
            Icons.info,
            color: AppColor.PRIMARY.color,
            size: 36,
          ),
        ),
      ],
    );
  }

  Future<Widget> _buildWidget(BuildContext context) async {
    return DynamicWidgetBuilder.build<FormBuilderState>(
        widget.jsonString, context, new DefaultClickListener(_fbKey),
        stateKey: _fbKey);
  }

  onButtonClick() {}
}

class DefaultClickListener implements ClickEventListener {
  GlobalKey<FormBuilderState> fbKey;

  DefaultClickListener(this.fbKey);

  @override
  void onClicked(ClickEvent event) {
    _handleClickEvent(event);
  }

  _handleClickEvent(ClickEvent clickEvent) async {
    switch (clickEvent.eventType) {
      case EventType.VALIDATE:
        if (fbKey.currentState.saveAndValidate()) {
          print(fbKey.currentState.value['name']);
        }
        break;
//   TODO:: Need to add more
    }

    if (clickEvent.onFinish != null) {
      _handleClickEvent(clickEvent.onFinish);
    }
  }
}
