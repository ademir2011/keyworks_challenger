import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keyworkds_challenger/src/rocket/domain/usecases/get_next_four_rockets.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_bloc.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_event.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_state.dart';
import 'package:keyworkds_challenger/src/utils/data_format_utils.dart';
import 'package:keyworkds_challenger/src/widgets/template_widget.dart';

class LaunchsListWidget extends StatefulWidget {
  const LaunchsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LaunchsListWidget> createState() => _LaunchsListWidgetState();
}

class _LaunchsListWidgetState extends State<LaunchsListWidget> {
  final rocketBloc = Modular.get<RocketBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      rocketBloc.add(GetNextFourRocketsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<RocketBloc, RocketState>(
        bloc: rocketBloc,
        builder: (ctx, state) {
          if (state is ErrorRocketState) {
            return const Center(
              child: Text('Houve um erro ao carregar os dados'),
            );
          }

          if (state is LoadingRocketState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is SuccessRocketState) {
            final rocketsLaunch = state.rocketsLaunch;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: rocketsLaunch.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Modular.to.navigate('/template/rocket/rocket_maps/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rocketsLaunch[index].name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              DataFormatUtils.formatDMYh(rocketsLaunch[index].date),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const Icon(Icons.place),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
