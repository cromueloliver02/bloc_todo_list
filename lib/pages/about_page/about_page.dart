import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../components/components.dart';
import '../../utils/utils.dart';

class AboutPage extends StatelessWidget {
  static const id = '/about';

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const TDLDrawer(),
      body: CustomScrollView(slivers: [
        const TDLSliverAppBar(title: 'About'),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed([
              Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_sy6jjyct.json',
                height: screenSize.width - 100,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello! 👋 ',
                        style: theme.textTheme.headline5,
                      ),
                      TextSpan(
                        text:
                            'This is my very first CRUD app using Flutter Bloc. Learning something is already a hobby of mine and I love growth and changes',
                        style: theme.textTheme.bodyText1!.copyWith(
                          fontSize: kRegularFontSize,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: const [
                    Text(
                      'Developer: Cromuel Barut',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Version: 1.0.0+1',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
