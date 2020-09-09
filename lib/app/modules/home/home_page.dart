import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_pattern_demo/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            padding: EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                onChanged: (value) => controller.onUserNameChanged(value),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "username"),
              ),
              TextField(
                onChanged: (value) => controller.onUserPasswordChanged(value),
                obscureText: true,
                decoration: InputDecoration(labelText: "password"),
              ),
              FlatButton(
                onPressed: () => controller.submit(),
                color: Colors.black,
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
