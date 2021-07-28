import 'package:flutter/material.dart';
import 'package:turaiev_test/global/ui/colors.dart';
import 'package:turaiev_test/global/ui/text_style.dart';
import 'package:turaiev_test/global/ui/widgets/app_bar.dart';
import 'package:turaiev_test/global/ui/widgets/button.dart';
import 'package:turaiev_test/global/ui/widgets/divider.dart';
import 'package:turaiev_test/resources/localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  static Page buildPage() {
    return const MaterialPage(
      child: const ProfileScreen(
        key: ValueKey('ProfileScreen'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.page(
        title: context.getText(TextId.profileScreenTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          _buildHeader(context),
          const CustomDivider.vertical(spacing: 12.0),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileInfo(context),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                onPressed: () {},
                child: Text('Settings'),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              flex: 1,
              child: CustomButton.cancel(
                onPressed: () {},
                child: Text('Saved'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: CustomColors.backgroundGrey,
          foregroundImage: NetworkImage('url'),
        ),
        const SizedBox(height: 12.0),
        Text('abc'),
        const SizedBox(height: 12.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStat(context,
              label: 'Followers',
              value: 25
            ),
            const SizedBox(height: 12.0),
            _buildStat(context,
              label: 'Likes',
              value: 15
            ),
            const SizedBox(height: 12.0),
            _buildStat(context,
              label: 'Following',
              value: 50
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildStat(BuildContext context, {
    required String label,
    required int value,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$value',
          style: CustomTextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700
          ),
        ),
        const SizedBox(height: 4.0),
        Text(label,
          style: CustomTextStyle(
            color: CustomColors.grey,
            fontSize: 12.0,
            fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text('content');
  }
}