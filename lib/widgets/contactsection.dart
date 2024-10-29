import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:portfolio/common/widgets/all_platform_links.dart';
import 'package:portfolio/constants/size.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../styles/style.dart';
import 'custom_text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
    _mobileController.addListener(_updateButtonState);
    _messageController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateButtonState);
    _mobileController.removeListener(_updateButtonState);
    _messageController.removeListener(_updateButtonState);
    _nameController.dispose();
    _mobileController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _mobileController.text.isNotEmpty &&
          _messageController.text.isNotEmpty;
    });
  }

  void _sendEmail() async {
    final String name = _nameController.text.trim();
    final String mobile = _mobileController.text.trim();
    final String message = _messageController.text.trim();

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'syedwaqarul786@gmail.com',
      query: 'subject=Contact from $name&body=Name: $name\nMobile: $mobile\nMessage: $message',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      IconSnackBar.show(
        context,
        label: "Something went Wrong!",
        labelTextStyle: const TextStyle(color: Colors.white),
        snackBarType: SnackBarType.fail,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      decoration: const BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const Text(
              "Get in touch",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                } else {
                  return buildNameEmailFieldMobile();
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              controller: _messageController,
              hintText: "Message",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style:_isButtonEnabled? kButtonStyle: kButtonStyleDisabled,
                onPressed: _isButtonEnabled ? _sendEmail : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "GET IN TOUCH",
                    style: TextStyle(color: CustomColor.whitePrimary, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          const AllPlatformLinks(),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Name",
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomTextField(
            controller: _mobileController,
            hintText: "Mobile",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        CustomTextField(
          controller: _nameController,
          hintText: "Name",
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _mobileController,
          hintText: "Email",
        ),
      ],
    );
  }
}
