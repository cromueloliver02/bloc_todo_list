import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../components/components.dart';
import '../pages/pages.dart';
import '../utils/utils.dart';

class TDLDrawer extends StatelessWidget {
  const TDLDrawer({Key? key}) : super(key: key);

  void _onToggleTheme(BuildContext ctx) =>
      ctx.read<ThemeBloc>().add(ToggleThemeEvent());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/cover.jpeg',
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black38,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: theme.colorScheme.primary,
                        radius: 30,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpeg',
                          ),
                          radius: 27,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 285,
                        child: Text(
                          'Cromuel D. Barut',
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.headline5!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 30,
              ),
              title: Text(
                'Home',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: kRegularFontSize,
                ),
              ),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                TabsPage.id,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.archive,
                size: 30,
              ),
              title: Text(
                'Archive',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: kRegularFontSize,
                ),
              ),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                ArchivePage.id,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Dark mode:',
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: kRegularFontSize,
                    ),
                  ),
                  BlocSelector<ThemeBloc, ThemeState, bool>(
                    selector: (state) => state.isDark,
                    builder: (ctx, isDark) => Switch(
                      value: isDark,
                      activeColor: theme.primaryColorLight,
                      onChanged: (value) => _onToggleTheme(context),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            TDLButton(
              label: 'Logout',
              type: ButtonType.text,
              iconData: Icons.logout,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
