import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/swipe/swipe_bloc.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'DISCOVER',
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(builder: (context, state) {
        if (state is SwipeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is SwipeLoaded) {
          var userCount = state.users.length;
          return Column(
            children: [
              InkWell(
                onDoubleTap: () {
                  Navigator.pushNamed(
                    context,
                    '/user',
                    arguments: state.users[0],
                  );
                },
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/user',
                    arguments: state.users[0],
                  );
                },
                child: Draggable(
                  feedback: UserCard(
                    user: state.users[0],
                  ),
                  childWhenDragging: (userCount > 1)
                      ? UserCard(
                          user: state.users[1],
                        )
                      : Container(),
                  onDragEnd: (drag) {
                    if (drag.velocity.pixelsPerSecond.dx < 0) {
                      context.read<SwipeBloc>().add(
                            SwipeLeft(
                              user: state.users[0],
                            ),
                          );
                    } else {
                      context.read<SwipeBloc>().add(
                            SwipeRight(
                              user: state.users[0],
                            ),
                          );
                    }
                  },
                  child: UserCard(
                    user: state.users[0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 60,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>().add(
                              SwipeLeft(
                                user: state.users[0],
                              ),
                            );
                      },
                      child: ChoiceButton(
                        color: Theme.of(context).colorScheme.secondary,
                        icon: Icons.clear_rounded,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>().add(
                              SwipeRight(
                                user: state.users[0],
                              ),
                            );
                      },
                      child: const ChoiceButton(
                        height: 80,
                        width: 80,
                        size: 35,
                        color: Colors.white,
                        hasGradiant: true,
                        icon: Icons.favorite,
                      ),
                    ),
                    ChoiceButton(
                      color: Theme.of(context).primaryColor,
                      icon: Icons.watch_later_outlined,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is SwipeError) {
          return Center(
            child: Text(
              'There are no more user to show.',
              style: Theme.of(context).textTheme.headline4,
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }
      }),
    );
  }
}
