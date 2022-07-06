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
      appBar: const CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(builder: (context, state) {
        if (state is SwipeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is SwipeLoaded) {
          return Column(
            children: [
              Draggable(
                feedback: UserCard(
                  user: state.users[0],
                ),
                childWhenDragging: UserCard(
                  user: state.users[1],
                ),
                onDragEnd: (drag) {
                  if (drag.velocity.pixelsPerSecond.dx < 0) {
                    context.read<SwipeBloc>().add(
                          SwipeLeftEvent(
                            user: state.users[0],
                          ),
                        );
                  } else {
                    context.read<SwipeBloc>().add(
                          SwipeRightEvent(
                            user: state.users[0],
                          ),
                        );
                  }
                },
                child: UserCard(
                  user: state.users[0],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 60,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>().add(
                              SwipeLeftEvent(
                                user: state.users[0],
                              ),
                            );
                      },
                      child: ChoiceButton(
                        height: 60,
                        width: 60,
                        size: 25,
                        color: Theme.of(context).accentColor,
                        hasGradiant: false,
                        icon: Icons.clear_rounded,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>().add(
                              SwipeRightEvent(
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
                      height: 60,
                      width: 60,
                      size: 25,
                      color: Theme.of(context).primaryColor,
                      hasGradiant: false,
                      icon: Icons.watch_later_outlined,
                    ),
                  ],
                ),
              ),
            ],
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
