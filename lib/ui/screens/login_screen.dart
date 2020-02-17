import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restofood_api/core/utils/toast_utils.dart';
import 'package:restofood_api/ui/widgets/input_field.dart';
import 'package:restofood_api/ui/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginBody(),
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void login(BuildContext context) {
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (Route<dynamic>routes) => false);
    
    }else{
      ToastUtils.show("Silahkan isi semua field");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Bagian Header
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          color: Colors.orange,
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fastfood,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "RestoFood",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
        ),
        //Bagian field Login
        Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        children: <Widget>[
          //Username
          InputField(
            action: TextInputAction.done,
            type: TextInputType.text,
            controller: usernameController,
            hintText: 'Username',
          ),
          SizedBox(height: 10,),
           //Password
          InputField(
            action: TextInputAction.done,
            type: TextInputType.text,
            controller: passwordController,
            hintText: 'Password',
            secureText: true,
          ),
          SizedBox(height: 15,),
          //UNTUK BUTTON
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: PrimaryButton(
              color: Colors.orange,
              text: 'Login',
              onClick: () => login(context),
            )
          )
        ],
      ),)
      ],
    );
  }
}
