import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turaiev_test/global/location/bloc.dart';
import 'package:turaiev_test/global/location/util.dart';
import 'package:turaiev_test/global/ui/colors.dart';
import 'package:turaiev_test/global/ui/text_style.dart';
import 'package:turaiev_test/global/ui/widgets/app_bar.dart';
import 'package:turaiev_test/global/ui/widgets/button.dart';
import 'package:turaiev_test/global/ui/widgets/divider.dart';
import 'package:turaiev_test/global/ui/widgets/grid.dart';
import 'package:turaiev_test/global/user/bloc.dart';
import 'package:turaiev_test/resources/icons.dart';
import 'package:turaiev_test/resources/localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  static Page buildPage() {
    return MaterialPage(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(create: (context) => UserBloc())
        ],
        child: const ProfileScreen(
          key: ValueKey('ProfileScreen'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) => BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) => Scaffold(
          appBar: CustomAppBar.page(
            title: userState.name,
          ),
          body: ListView(
            padding: const EdgeInsets.all(12.0),
            children: [
              _buildHeader(context, userState),

              const CustomDivider.vertical(spaceBefore: 12.0),

              _buildContent(context, userState),
            ],
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, UserState userState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileInfo(context, userState),

        const SizedBox(height: 12.0),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded( // TODO for
              flex: 1,
              child: CustomButton(
                onPressed: () {},
                child: Text(context.getText(TextId.settings)),
                style: CustomButton.styleFrom(
                  padding: EdgeInsets.all(12.0),
                ),
              ),
            ),

            const SizedBox(width: 12.0),

            Expanded(
              flex: 1,
              child: CustomButton.cancel(
                onPressed: () {},
                child: Text(context.getText(TextId.saved)),
                style: CustomButton.styleFrom(
                  padding: EdgeInsets.all(12.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileInfo(BuildContext context, UserState userState) {
    final stats = {
      TextId.followers: userState.followers,
      TextId.likes: userState.likes,
      TextId.following: userState.following,
    };

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: CustomColors.backgroundGrey,
          foregroundImage: NetworkImage(userState.avatarUrl),
          radius: 36.0,
        ),

        const SizedBox(height: 12.0),

        Text(userState.name,
          style: CustomTextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 12.0),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final entry in stats.entries)
              _buildStat(context,
                label: context.getText(entry.key),
                value: entry.value,
              ),
          ].expand((w) => [w, const SizedBox(width: 12.0,)]).toList()..removeLast(),
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
            color: CustomColors.lightGrey,
            fontSize: 12.0,
            fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, UserState userState) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorColor: CustomColors.black,
            labelStyle: CustomTextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            labelColor: CustomColors.black,
            unselectedLabelColor: CustomColors.lightGrey,
            tabs: [
              Container(
                padding: EdgeInsets.all(12.0),
                child: Text(context.getText(TextId.outfits)),
              ),

              Container(
                padding: EdgeInsets.all(12.0),
                child: Text(context.getText(TextId.publications)),
              ),
            ],
          ),

          _buildOutfits(context, userState),

          const SizedBox(height: 12.0),

          CustomButton(
            child: Text('пасхалка'),
            onPressed: () {
              final bloc = context.read<LocationBloc>();
              final newLocation = bloc.state.location == Location.en ? Location.ru : Location.en;
              bloc.add(UpdateLocationEvent(location: newLocation));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOutfits(BuildContext context, UserState userState) {
    return CustomGrid(
      crossAxisCount: 3,
      ratio: 1,
      itemCount: userState.imgUrlList.length,
      builder: (context, i, j) {
        return Image.network(userState.imgUrlList[i * 3 + j],
          fit: BoxFit.cover,
        );
      }
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final navBarItems = {
      'Home': CustomIcons.home,
      'Smile': CustomIcons.smilingFace,
      'Profile': CustomIcons.person,
      'Settings': CustomIcons.settings,
    };

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: 3,
      backgroundColor: CustomColors.backgroundGrey,
      selectedItemColor: CustomColors.black,
      unselectedItemColor: CustomColors.grey,
      items: [
        for (final entry in navBarItems.entries)
          BottomNavigationBarItem(
            icon: SvgPicture.asset(entry.value),
            label: entry.key,
          ),
      ],
    );
  }
}