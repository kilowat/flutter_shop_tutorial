import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/widgets/form_input_wrapper.dart';
import 'package:flippy/features/presentation/widgets/primary_button.dart';
import 'package:flippy/features/presentation/widgets/soc_login.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: Styles.paddingDefault,
          right: Styles.paddingDefault,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildFormInputs(context),
              SocLogin(),
            ],
          ),
        ),
      ),
    );
  }

  _buildFormInputs(context) {
    return Container(
      child: Column(
        children: [
          FormInputWrapper(
            textFormField: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: Styles.inputFormDecoration.copyWith(
                labelText: "User Name",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FormInputWrapper(
            textFormField: TextFormField(
              decoration: Styles.inputFormDecoration.copyWith(
                labelText: "Email",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FormInputWrapper(
            textFormField: TextFormField(
              obscureText: _obscureText,
              decoration: Styles.inputFormDecoration.copyWith(
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(_obscureText
                      ? Icons.visibility_off
                      : Icons.visibility_rounded),
                  onPressed: _toggleObscure,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text('Already have an  account?'),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            child: PrimaryButton(
              text: "Register",
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }

  _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
