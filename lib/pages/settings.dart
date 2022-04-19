/// import libraries
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with AutomaticKeepAliveClientMixin<Settings> {
  /// To keep the state of the switches even after going to other pages
  @override
  bool get wantKeepAlive => true;

  /// variables
  bool notificationIsActive = false;
  bool darkModeIsActive = false;
  Map data = {};
  final formkey = GlobalKey<FormState>();
  String email = '';
  String subject = '';
  String feedbackContent = '';

  /// basic building block for setting title
  GestureDetector buildSettingTile(
      BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: (() {
        /// build feedback dialog if title is equals to feedback
        if (title == 'Feedback') {
          showDialog(
            context: context,
            builder: (context) => openFeedbackDialog(),
          );
        } else if (title == 'Tutorial') {
          Navigator.of(context).pushReplacementNamed(route);
        }

        /// navigate to respective pages
        else {
          Navigator.pushNamed(context, route);
        }
      }),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: 45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF343A40)),
            ],
          ),
        ),
      ),
    );
  }

  /// function for feedback dialog
  Widget openFeedbackDialog() {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: Color(0xFF1565C0)),
        child: const Center(
            child: Text('Feedback Form',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ))),
      ),
      titlePadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// feedback form details
            Form(
              key: formkey,
              autovalidateMode: AutovalidateMode
                  .onUserInteraction, // check if validate or not when user is typing
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.email_rounded, size: 30.0),
                        labelText: 'Email',
                        labelStyle: const TextStyle(fontSize: 15.0),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        hintText: 'Enter your email',
                        hintStyle: const TextStyle(fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        /// to check if it is a valid email address or not
                        const emailPattern =
                            r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                        final regExp = RegExp(emailPattern);

                        if (value!.isEmpty) {
                          return 'Enter an email';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Invalid email address';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) => setState(() {
                        email = value!;
                      }),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.subject_rounded, size: 30.0),
                        labelText: 'Subject',
                        labelStyle: const TextStyle(fontSize: 15.0),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        hintText: 'Enter your subject',
                        hintStyle: const TextStyle(fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onSaved: (value) => setState(() {
                        subject = value!;
                      }),
                    ),
                  ),

                  /// content of the feedback
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      maxLines: 7, // allow multiple lines input for users
                      maxLength: 300, // avoid too lengthy feedback
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        alignLabelWithHint: true,
                        labelText: 'Feedback',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onSaved: (value) => setState(() {
                        feedbackContent = value!;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            /// Cancel button
            Expanded(
                child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                primary: const Color(0xFF1565C0),
              ),
              child: const Text('Cancel'),
            )),

            const SizedBox(width: 10),

            /// Submit button
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                final isValid = formkey.currentState?.validate();
                if (isValid!) {
                  formkey.currentState?.save();
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.of(context).pop(true);
                        });
                        return submittedDialog();
                      });
                }
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                primary: const Color(0xFF1565C0),
              ),
              child: const Text('Submit'),
            )),
          ],
        ),
      ],
    );
  }

  /// submitted dialog
  Widget submittedDialog() {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.height / 2,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Submitted!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF43AA8B))),
            Text('Thank you for your opinions', style: TextStyle(fontSize: 15)),
          ],
        )),
      ),
    );
  }

  Widget onoffSwitchTemplate(String title) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF343A40)),
            ),
            Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: notificationIsActive,
                  activeColor: const Color(0xFF43AA8B),
                  onChanged: (bool value) {
                    setState(() {
                      notificationIsActive = value;
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      /// Set background colour
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE9ECEF),
        titleSpacing: 0, // change the sapcing between leading icon and title
        leading:
            const Icon(Icons.settings, size: 32.0, color: Color(0xFF343A40)),
        centerTitle: false,
        title: const Text('Settings',
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: Color(0xFF343A40),
              fontSize: 30.0,
              fontWeight: FontWeight.w800,
            )),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            /// Space between title and the image
            const SizedBox(height: 10.0),

            /// Display the HKUST image
            const Image(image: AssetImage('images/hkust_redbird.jpg')),

            /// Space between image and the details of settings
            const SizedBox(height: 10.0),

            /// Heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Notifications',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF343A40)),
              ),
            ),

            const SizedBox(height: 10.0),

            Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 45,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Push notifications',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF343A40)),
                    ),
                    Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: notificationIsActive,
                          activeColor: const Color(0xFF43AA8B),
                          onChanged: (bool value) {
                            setState(() {
                              notificationIsActive = value;
                            });
                          },
                        )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 45,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dark mode (beta)',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF343A40)),
                    ),
                    Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: darkModeIsActive,
                          activeColor: const Color(0xFF43AA8B),
                          onChanged: (bool value) {
                            setState(() {
                              darkModeIsActive = value;
                            });
                          },
                        )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20.0),
            buildSettingTile(context, 'About us', '/settings/aboutus'),
            buildSettingTile(context, 'Acknowledgements', '/settings/ack'),
            buildSettingTile(context, 'Feedback', '/settings/feedback'),
            buildSettingTile(context, 'Tutorial', '/settings/tutorial'),
            buildSettingTile(context, 'Privacy and Terms', '/settings/privacy'),
          ],
        ),
      ),
    );
  }
}
