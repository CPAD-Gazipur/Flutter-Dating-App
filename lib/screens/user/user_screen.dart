import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({Key? key, required this.user}) : super(key: key);

  static const String routeName = '/user';
  static Route route({required User user}) {
    return MaterialPageRoute(
      builder: (_) => UserScreen(
        user: user,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Hero(
                    tag: 'user_image',
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icons.clear_rounded,
                        ),
                        const ChoiceButton(
                          height: 80,
                          width: 80,
                          size: 35,
                          color: Colors.white,
                          hasGradiant: true,
                          icon: Icons.favorite,
                        ),
                        ChoiceButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icons.watch_later_outlined,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  user.jobTitle,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(height: 15),
                Text(
                  'About',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  user.bio,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        height: 2,
                      ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Interests',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Row(
                  children: user.interests
                      .map(
                        (interest) => Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(
                            top: 5.0,
                            right: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFD84482),
                                Color(0xFFF77F46),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Text(
                            interest,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
