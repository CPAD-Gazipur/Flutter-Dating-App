import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/blocs.dart';

import '../../repositories/repositories.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) {
        debugPrint(BlocProvider.of<AuthBloc>(context).state.status.toString());
        return (BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated)
            ? const OnBoardingScreen()
            : const ProfileScreen();
      },
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'PROFILE',
        hasAction: false,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProfileLoaded) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  UserImage.medium(
                    imageUrl: state.user.imageUrls.isEmpty
                        ? null
                        : state.user.imageUrls[0],
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.1),
                            Theme.of(context).primaryColor.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.user.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                state.user.jobTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleWithIcon(
                            title: 'Biography', icon: Icons.edit),
                        Text(
                          state.user.bio,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.5),
                          textAlign: TextAlign.justify,
                        ),
                        const TitleWithIcon(
                            title: 'Pictures', icon: Icons.edit),
                        SizedBox(
                          height: 125,
                          child: state.user.imageUrls.isEmpty
                              ? ListView.builder(
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: UserImage.small(
                                        width: 100,
                                        imageUrl: null,
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  itemCount: state.user.imageUrls.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: UserImage.small(
                                        width: 100,
                                        imageUrl: state.user.imageUrls[index],
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        const TitleWithIcon(
                            title: 'Location', icon: Icons.edit),
                        Text(
                          state.user.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.5),
                          textAlign: TextAlign.justify,
                        ),
                        const TitleWithIcon(
                            title: 'Interests', icon: Icons.edit),
                        Row(
                          children: [
                            CustomTextContainer(text: state.user.interests[0]),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            RepositoryProvider.of<AuthRepository>(context)
                                .signOut();
                          },
                          child: Center(
                            child: Text(
                              'Sign Out',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Something went wrong.'),
              );
            }
          },
        ),
      ),
    );
  }
}
