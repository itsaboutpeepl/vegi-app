import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class ReduxStateViewer extends StatefulWidget {
  const ReduxStateViewer(
    this.store, {
    Key? key,
    this.actionMaxLines = 2,
    this.stateMaxLines = 5,
  }) : super(key: key);

  static final saveKey = UniqueKey();
  static final resetKey = UniqueKey();
  static final recomputeKey = UniqueKey();

  /// The DevToolsStore the ReduxDevTools will interact with
  final DevToolsStore<AppState> store;

  /// The number of maxLines to render action objects
  final int actionMaxLines;

  /// The number of maxLines to render state objects
  final int stateMaxLines;

  @override
  State<ReduxStateViewer> createState() => _ReduxStateViewerState();
}

class _ReduxStateViewerState extends State<ReduxStateViewer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ReduxDevToolsViewModel>(
      stream: widget.store.onChange.map((_) {
        return ReduxDevToolsViewModel(
          widget.store,
          _ContainerState.of(context),
          context,
        );
      }),
      builder: (context, snapshot) {
        final halfHeight = MediaQuery.of(context).size.height * 0.5;
        final model = snapshot.hasData
            ? snapshot.data!
            : ReduxDevToolsViewModel(
                widget.store,
                _ContainerState.of(context),
                context,
              );

        return MyScaffold(
          title: 'Dev Tools',
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 20,
                    bottom: 20,
                  ),
                  child: const Text(
                    'History of Actions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: halfHeight,
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.all(12),
                  child: PageView.builder(
                    itemCount: model.stagedActions.length,
                    itemBuilder: (_, index) {
                      return Text(model.stagedActions[index].toString());
                    },
                  ),
                ),
                Container(
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 20,
                    bottom: 20,
                  ),
                  child: const Text(
                    'Current User State',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: halfHeight,
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.all(12),
                  child: StatePropertyTile(
                    data: model.userState,
                  ),
                ),
                Container(
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 20,
                    bottom: 20,
                  ),
                  child: const Text(
                    'Current Cash Wallet State',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: halfHeight * 0.5,
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.all(12),
                  child: StatePropertyTile(
                    data: model.cashWalletState,
                  ),
                ),
                Container(
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 20,
                    bottom: 20,
                  ),
                  child: const Text(
                    'Current Cart State',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: halfHeight,
                  alignment: FractionalOffset.topLeft,
                  padding: const EdgeInsets.all(12),
                  child: StatePropertyTile(
                    data: model.cartState,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StatePropertyTile extends StatelessWidget {
  const StatePropertyTile({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.entries.map<Widget>(
        (element) {
          if (element.value is String ||
              element.value is bool ||
              element.value is int ||
              element.value is DateTime) {
            return ListTile(
              leading: Text(element.key),
              trailing: Text(
                element.value.toString().maxChars(10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }
          if (element.value is List || element.value is Map) {
            return ListTile(
              leading: Text(element.key),
              trailing: GestureDetector(
                child: const Text('Click to View'),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: [
                              Text(
                                element.value.toString(),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ).toList(),
    );
  }
}

class ReduxDevToolsViewModel {
  final String latestAction;
  final String latestState;
  final Map<String, dynamic> userState;
  final Map<String, dynamic> cashWalletState;
  final Map<String, dynamic> cartState;
  final Map<String, dynamic> menuItemState;
  final Map<String, dynamic> pastOrderState;
  final VoidCallback onSavePressed;
  final VoidCallback onResetPressed;
  final VoidCallback onRecomputePressed;
  final ValueChanged<double> onSliderChanged;
  final double sliderMax;
  final double sliderPosition;
  final Color? recomputeColor;
  final String recomputeButtonString;
  final List<dynamic> stagedActions;

  ReduxDevToolsViewModel._({
    required this.recomputeColor,
    required this.latestAction,
    required this.latestState,
    required this.onSavePressed,
    required this.onResetPressed,
    required this.onRecomputePressed,
    required this.onSliderChanged,
    required this.sliderMax,
    required this.sliderPosition,
    required this.recomputeButtonString,
    required this.userState,
    required this.cartState,
    required this.cashWalletState,
    required this.menuItemState,
    required this.pastOrderState,
    required this.stagedActions,
  });

  factory ReduxDevToolsViewModel(
    DevToolsStore<AppState> store,
    _ContainerState? containerState,
    BuildContext context,
  ) {
    return ReduxDevToolsViewModel._(
      stagedActions: store.devToolsState.stagedActions,
      cashWalletState: store.state.cashWalletState.toJson(),
      menuItemState: store.state.menuItemState.toJson(),
      pastOrderState: store.state.pastOrderState.toJson(),
      cartState: store.state.cartState.toJson(),
      userState: store.state.userState.toJson(),
      latestAction: store.devToolsState.latestAction.toString(),
      latestState: store.state.toString(),
      onSavePressed: () => store.dispatch(DevToolsAction.save()),
      onResetPressed: () => store.dispatch(DevToolsAction.reset()),
      recomputeColor:
          containerState != null && containerState.recomputeOnHotReload
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).textTheme.button?.color,
      onRecomputePressed: () {
        if (containerState != null) {
          containerState.toggleRecomputeOnHotReload();
        } else {
          store.dispatch(DevToolsAction.recompute());
        }
      },
      recomputeButtonString: containerState == null
          ? 'Recompute'
          : 'Toggle "Recompute on Hot Reload"',
      onSliderChanged: (val) =>
          store.dispatch(DevToolsAction.jumpToState(val.floor())),
      sliderMax: (store.devToolsState.computedStates.length - 1).toDouble(),
      sliderPosition: store.devToolsState.currentPosition.toDouble(),
    );
  }
}

/// Hot Reload for your State! Change your Reducers? The state will be
/// recomputed and your UI will update, pronto.
///
/// To make this work, it's best to wrap your whole app with this Widget. That
/// way it will always remain mounted and can listen to Hot Reload changes for
/// any Route.
///
/// Since you won't want to wrap your Production app with any Dev Tools, it's
/// best to only use this in Dev mode. See the `example` directory of this
/// repo for a demonstration of how to do this.
class ReduxDevToolsContainer<S> extends StatefulWidget {
  final Store<S> store;
  final Widget child;
  final bool recomputeOnHotReload;

  ReduxDevToolsContainer({
    Key? key,
    required this.store,
    required this.child,
    this.recomputeOnHotReload = true,
  }) : super(key: key);

  @override
  _ReduxDevToolsRecomputeState createState() {
    return _ReduxDevToolsRecomputeState();
  }
}

class _ReduxDevToolsRecomputeState extends State<ReduxDevToolsContainer> {
  bool _recomputeOnHotReload = false;

  @override
  Widget build(BuildContext context) {
    return _ContainerState(
      recomputeOnHotReload: _recomputeOnHotReload,
      toggleRecomputeOnHotReload: _toggleRecomputeOnHotReload,
      child: widget.child,
    );
  }

  void _toggleRecomputeOnHotReload() {
    setState(() {
      _recomputeOnHotReload = !_recomputeOnHotReload;
    });
  }

  @override
  void reassemble() {
    if (_recomputeOnHotReload) {
      widget.store.dispatch(DevToolsAction.recompute());
    }

    super.reassemble();
  }

  @override
  void initState() {
    super.initState();

    _recomputeOnHotReload = widget.recomputeOnHotReload;
  }
}

class _ContainerState extends InheritedWidget {
  final bool recomputeOnHotReload;
  final Function() toggleRecomputeOnHotReload;

  _ContainerState({
    Key? key,
    required Widget child,
    required this.recomputeOnHotReload,
    required this.toggleRecomputeOnHotReload,
  }) : super(key: key, child: child);

  static _ContainerState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ContainerState>();
  }

  @override
  bool updateShouldNotify(_ContainerState oldWidget) {
    return recomputeOnHotReload != oldWidget.recomputeOnHotReload;
  }
}


/*
ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 12,
                ),
                child: Slider(
                  value: model.sliderPosition,
                  onChanged: model.onSliderChanged,
                  max: model.sliderMax,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.save),
                      key: ReduxStateViewer.saveKey,
                      onPressed: model.onSavePressed,
                      tooltip: 'Save',
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.restore),
                      key: ReduxStateViewer.resetKey,
                      onPressed: model.onResetPressed,
                      tooltip: 'Reset',
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.functions,
                        color: model.recomputeColor,
                      ),
                      key: ReduxStateViewer.recomputeKey,
                      onPressed: model.onRecomputePressed,
                      tooltip: model.recomputeButtonString,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: InkWell(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView(
                              children: [
                                Text(
                                  model.latestState,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: FractionalOffset.topLeft,
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 8,
                          bottom: 0,
                          right: 0,
                        ),
                        child: const Text(
                          'Current User State',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        alignment: FractionalOffset.topLeft,
                        padding: const EdgeInsets.all(12),
                        child: StatePropertyTile(
                          data: model.userState,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: [
                              Text(
                                model.latestAction,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: FractionalOffset.topLeft,
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 8,
                        bottom: 0,
                        right: 0,
                      ),
                      child: const Text(
                        'Current Action',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      alignment: FractionalOffset.topLeft,
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        model.latestAction,
                        maxLines: widget.actionMaxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
*/