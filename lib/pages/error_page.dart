import 'package:flutter/material.dart';
import 'package:flutter_cozy/pages/home_page.dart';
import 'package:flutter_cozy/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/404.png',
              width: 300,
              height: 85.95,
            ),
            const SizedBox(
              height: 70.05,
            ),
            Text(
              'Where are you going?',
              style: titleTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were\nrequested is already gone',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                  (route) => false),
              style: ElevatedButton.styleFrom(
                primary: purpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 42,
                ),
                child: Text(
                  'Back to Home',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
