// // import 'dart:async';
// // import 'dart:collection';
// // import 'dart:convert';
// // import 'dart:html';
// // import 'dart:math' as math;

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:logging/logging.dart';
// // import 'package:flutter/services.dart' show rootBundle;
// // import 'package:tuple/tuple.dart';
// // import 'package:web_socket_channel/web_socket_channel.dart';
// // import 'package:web_socket_channel/status.dart' as status;
// // import 'package:flutter_dotenv/flutter_dotenv.dart';
// // import 'package:ansicolor/ansicolor.dart';
// // import 'package:webtemplate/ui/model/app_state_manager.dart';
// // // import 'dart:html' as html;

// // import '../../utils/ansi_print_colors.dart';
// // import '../../utils/pipe.dart';
// // import 'network.dart';
// // import 'web_socket/web_socket.dart';
// // import '../model/all_models.dart';
// // import 'socket_service.dart';
// // import 'wsocketio_mixin.dart';

// // const String apiKey = '<Your Key>';
// // const String apiId = '<your ID>';
// // const String appHost = '127.0.0.1';
// // const String appPort = '8443';
// // const String appWSPort = '8443';

// // const String apiUrl = 'http://$appHost:$appPort';
// // const String apiWSUrl = 'http://$appHost:$appWSPort';
// // // const String wsUrl = 'ws://$appHost:$appPort/websocket';
// // const String wsSocketioUrl = 'ws://$appHost:$appWSPort/socket.io';

// class HttpClientGember extends http.BaseClient {
//   final _httpClient = http.Client();

//   HttpClientGember();

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) {
//     Map<String, String> defaultHeaders = <String, String>{
//       // 'Content-Type': 'application/json; charset=UTF-8',
//       'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
//       // 'Host': '$appHost:$appPort',
//       // 'Connection': 'keep-alive',
//       // 'Sec-Ch-Ua':
//       //     '" Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"',
//       // 'Sec-Ch-Ua-Mobile': '?0',
//       // 'User-Agent':
//       //     "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36",
//       // 'Sec-Ch-Ua-Platform': '"macOS"',
//       'Accept': '*/*',
//       //TODO: remove the reliance on html by removing the origin header
//       // 'Origin':
//       //     'http://${html.window.location.host}:${html.window.location.port}/',
//       // 'Sec-Fetch-Site': 'cross-site',
//       // 'Sec-Fetch-Mode': 'cors',
//       // 'Sec-Fetch-Dest': 'empty',
//       // 'Referer':
//       //     'http://${html.window.location.host}:${html.window.location.port}/',
//       // 'Accept-Encoding': 'gzip, deflate, br',
//       'Accept-Language': 'en-GB,en-US;q=0.9,en;q=0.8',
//       // 'GEMBER_API_KEY': dotenv.env['APPKEY'] ?? '',
//     };
//     // var uri = request.url;
//     // final queryParameters = {
//     //   'GEMBER_API_KEY': dotenv.env['APPKEY'] ?? '',
//     // };
//     // queryParameters.addAll(uri.queryParameters);
//     // request.url = Uri(
//     //   scheme: uri.scheme,
//     //   fragment: uri.fragment,
//     //   path: uri.path,
//     //   queryParameters: queryParameters,
//     //   userInfo: uri.userInfo,
//     // );
//     // final uri =
//     //     Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
//     // final response = await http.get(uri, headers: {
//     //   HttpHeaders.authorizationHeader: 'Token $token',
//     //   HttpHeaders.contentTypeHeader: 'application/json',
//     // });
//     request.headers.addAll(defaultHeaders);
//     return _httpClient.send(request);
//   }
// }

// // mixin WSBaseMixin on IMarketStateViewer {
// //   SimulationProgressData? _parseSimulationProgressData(dynamic event) {
// //     try {
// //       var i = event["iteration_number"];
// //       log.fine(PrintPens.greenPen('ran_iteration_$i'));
// //       return SimulationProgressData(data: event);
// //     } on Exception catch (e) {
// //       log.warning('market_state_viewer._parseSimulationProgressData threw $e');
// //       return null;
// //     }
// //   }
// // }

// // abstract class WebSocketHandlers extends IMarketStateViewer with WSBaseMixin {
// //   late final transactionHandlers = <String, void Function(dynamic data)>{
// //     WebSocketServerResponseEvent.bank_transaction_completed: (dynamic data) {
// //       if (_transactionEmitterController.hasListener) {
// //         WebSocketMessageHandler parser = SocketioMessageHandler(
// //             type: WebSocketServerResponseEvent.bank_transaction_completed,
// //             data: data);
// //         if (parser.looksLikeTransactionJson()) {
// //           var transaction = parser.getTransactionModelFromJson();
// //           if (transaction != null) {
// //             _transactionEmitterController.add(transaction);
// //           }
// //         }
// //       }
// //     },
// //   };

// //   late final simulationHandlers = <String, void Function(dynamic data)>{
// //     WebSocketServerResponseEvent.simulation_iteration_completed:
// //         (dynamic data) {
// //       if (_simulationProgressEmitterController.hasListener) {
// //         WebSocketMessageHandler parser = SocketioMessageHandler(
// //             type: WebSocketServerResponseEvent.simulation_iteration_completed,
// //             data: data);
// //         final simulationData = _parseSimulationProgressData(parser.data);
// //         pipe_if_exists(
// //             simulationData, _simulationProgressEmitterController.add);
// //       }
// //     },
// //     WebSocketServerResponseEvent.simulation_ran: (dynamic data) {
// //       if (_simulationProgressEmitterController.hasListener) {
// //         WebSocketMessageHandler parser = SocketioMessageHandler(
// //             type: WebSocketServerResponseEvent.simulation_ran, data: data);
// //         final simulationData = _parseSimulationResult(parser.data);
// //         // if (appStateMgr.runningSimulation) {
// //         _flagStopRunSim();
// //         appStateMgr.addCompletedSimulation(simulationData);
// //         appStateMgr.refreshSimulationComparisonHistory();
// //         // }
// //       } else {
        
// //       }
// //     },
// //   };

// //   late final globalNamespaceHandlers = <String, void Function(dynamic data)>{
// //     WebSocketServerResponseEvent.purchase_delay: (dynamic data) {
// //       if (_simulationProgressEmitterController.hasListener) {
// //         purchaseDelaySeconds =
// //             double.tryParse(data.toString()) ?? purchaseDelaySeconds;
// //         notifyListeners();
// //       }
// //     },
// //     WebSocketServerResponseEvent.entity_updated: (dynamic data) {
// //       WebSocketMessageHandler parser = SocketioMessageHandler(
// //           type: WebSocketServerResponseEvent.entity_updated, data: data);
// //       if (parser.looksLikeEntityJson()) {
// //         var entity = parser.getEntityModelFromJson();
// //         if (entity != null) {
// //           _updateEntityInCatalog(entity);
// //           notifyListeners();
// //         }
// //       }
// //     },
// //     WebSocketServerResponseEvent.num_customers_requested: (dynamic data) {
// //       _updateNumCustomers(data);
// //     },
// //     WebSocketServerResponseEvent.basket_full_size_requested: (dynamic data) {
// //       _updateBasketSize(data);
// //     },
// //     WebSocketServerResponseEvent.num_shop_trips_requested: (dynamic data) {
// //       _updateNumShoppingTrips(data);
// //     },
// //     WebSocketServerResponseEvent.retailer_strategy_changed: (dynamic data) {
// //       _updateRetailerStrategy(data['name'], data['strategy']);
// //     },
// //     WebSocketServerResponseEvent.retailer_sustainbility_changed:
// //         (dynamic data) {
// //       _updateRetailerSustainabilityRating(data['name'], data['sustainability']);
// //     },
// //     WebSocketServerResponseEvent.pong: (dynamic data) {
// //       log.fine(PrintPens.orangePen('pong received'));
// //     },
// //   };
// // }

// // /**
// //  * [IMarketStateViewer] is a singleton that implements [ChangeNotifier]
// //  */
// // abstract class IMarketStateViewer extends ChangeNotifier {
// //   // factory IMarketStateViewer.create() {
// //   //   _instance ??= IMarketStateViewer._privateConstruct();
// //   //   return _instance!;
// //   // }

// //   // IMarketStateViewer._privateConstruct();

// //   // IMarketStateViewer() : super();

// //   AppStateManager get appStateMgr => AppStateManager.getInstance(this);

// //   // static IMarketStateViewer? _instance;

// //   final List<TransactionModel> transactions = <TransactionModel>[];
// //   int get counter => transactions.length;

// //   late bool eventNamesClientSendsToServerSynced;
// //   late bool eventNamesServerSendsToClientSynced;

// //   abstract String connectionStatus;
// //   bool get webSocketConnected => false;

// //   bool _runningSimulation = false;
// //   bool get simulationInProgress => _runningSimulation;

// //   void _flagStartRunSim() {
// //     _runningSimulation = true;
// //     notifyListeners();
// //   }

// //   void _flagStopRunSim() {
// //     _runningSimulation = false;
// //     notifyListeners();
// //   }

// //   bool _httpCallInProgress = false;
// //   bool get httpCallInProgress => _httpCallInProgress;

// //   void _flagStartHttpCall() {
// //     _httpCallInProgress = true;
// //     notifyListeners();
// //   }

// //   void _flagStopHttpCall() {
// //     _httpCallInProgress = false;
// //     notifyListeners();
// //   }

// //   int? _basketSizeForNextSim;
// //   int? get basketSizeForNextSim => _basketSizeForNextSim;

// //   int? _numTripsToShopsForNextSim;
// //   int? get numTripsToShopsForNextSim => _numTripsToShopsForNextSim;

// //   int? _numCustomersForNextSim;
// //   int? get numCustomersForNextSim => _numCustomersForNextSim;

// //   final log = Logger('MarketStateViewer');

// //   /// the subscription that we use to subscribe to the websockets entire channel
// //   late StreamSubscription<dynamic>? _websocketChannelSubscription;

// //   /// A stream created by the [MarketStateViewer] to push updates to consumers... -> should be using notifyListeners...
// //   final _transactionEmitterController = StreamController<TransactionModel>();

// //   // late StreamSubscription<dynamic>? _simulationProgressSubscription;

// //   final _simulationProgressEmitterController =
// //       StreamController<SimulationProgressData>();

// //   bool backendServerDead = false;

// //   GemberAppConfig? _simConfig;

// //   LoadEntitiesResult _EntityCatalog = LoadEntitiesResult(
// //     retailers: <RetailerModel>[],
// //     retailersCluster: AggregatedRetailers.zero(),
// //     customers: <CustomerModel>[],
// //     // basketFullSize: 1,
// //     // numShopTrips: 1,
// //   );

// //   List<String> _retailerNames = <String>[];

// //   List<String> get retailerNames => _retailerNames;

// //   set retailerNames(List<String> val) {
// //     if (_EntityCatalog.isEmpty) {
// //       _retailerNames = val;
// //     } else {
// //       if (val.every((element) =>
// //           _EntityCatalog.retailersCluster.retailerNames.contains(element))) {
// //         _retailerNames = _EntityCatalog.retailersCluster.retailerNames;
// //       } else {
// //         throw Exception(
// //             'Retailer names in setter do not match the retailer names already in the EntityCatalog');
// //       }
// //     }
// //   }

// //   AppTransactionsStateModel _allTransactions = AppTransactionsStateModel(
// //     transactionsByEntityId: <String, List<TransactionModel>>{},
// //   );

// //   final Map<String, LoadTransactionsForEntityResult> _transactions =
// //       Map<String, LoadTransactionsForEntityResult>();

// //   int get transactionsCounter => _transactions.length;

// //   void testWsConnMemory();

// //   /// Loads config params that are front end parameters only and are updated by posting params for new sims for using to post for new simulations.
// //   Future<GemberAppConfig> loadGemberAppConfig(String simulationId);

// //   GemberAppConfig _loadGemberAppConfig(dynamic json) {
// //     GemberAppConfig config = GemberAppConfig.fromJson(json);
// //     _numTripsToShopsForNextSim = config.NUM_SHOP_TRIPS_PER_ITERATION;
// //     _numCustomersForNextSim = config.NUM_CUSTOMERS;
// //     _basketSizeForNextSim = config.BASKET_FULL_SIZE;
// //     notifyListeners();
// //     return config;
// //   }

// //   void _updateBasketSize(int newSize) {
// //     _basketSizeForNextSim = newSize;
// //     notifyListeners();
// //   }

// //   void _updateNumCustomers(int newSize) {
// //     _numCustomersForNextSim = newSize;
// //     notifyListeners();
// //   }

// //   void _updateNumShoppingTrips(int newSize) {
// //     _numTripsToShopsForNextSim = newSize;
// //     notifyListeners();
// //   }

// //   bool _checkInitAppResponseOK(String? initAppResponse) {
// //     if (initAppResponse != null) {
// //       var jsonMap = jsonDecode(initAppResponse);
// //       if (jsonMap['status'] == HttpStatus.ok) {
// //         return true;
// //       }
// //     }
// //     return false;
// //   }

// //   final Map<String, LoadSalesForItem> _salesByitem =
// //       Map<String, LoadSalesForItem>();

// //   final httpClient = HttpClientGember();

// //   void transactionOccured(TransactionModel t) {
// //     transactions.add(t);
// //     notifyListeners();
// //   }

// //   SimulationResult _parseSimulationResult(Map<String, dynamic> data) {
// //     return SimulationResult.fromJson(data);
// //   }

// //   Future<bool> initialiseGemberPointsApp();

// //   Future<LoadEntitiesResult> loadEntities({GemberAppConfig? configOptions});

// //   Future<List<String>> loadRetailerNames();

// //   void _loadEntities(String? data) {
// //     try {
// //       if (data != null) {
// //         final dataMap = jsonDecode(data);
// //         _EntityCatalog = LoadEntitiesResult.fromJson(dataMap);
// //         notifyListeners();
// //       }
// //     } catch (err) {
// //       log.warning(err);
// //     }
// //   }

// //   SimulationTokenModel? _getSimulationIdFromResponse(String? response) {
// //     if (response == null) {
// //       return null;
// //     }
// //     var dataMap = jsonDecode(response);
// //     return SimulationTokenModel.fromJson(dataMap);
// //   }

// //   Future<T?> getTaskResult<T extends TSerializable>(
// //       String taskId, T Function(dynamic jsonDecoded) fromJson);

// //   Future<RunSimulationResponseModel?> runIsolatedSimIteration({
// //     required GemberAppConfig configOptions,
// //   });

// //   Future<RunSimulationResponseModel?> runFullSimulation({
// //     required GemberAppConfig configOptions,
// //   });

// //   Future<RunSimulationResponseModel?> runRealTimeScenario({
// //     required GemberAppConfig configOptions,
// //   });

// //   Future<SimulationResult?> getSimulationResult({required String simulationId});

// //   Future<SimulationComparisonHistory?> getSimulationComparisonHistory({
// //     required List<String> simulationIds,
// //     required String retailerName,
// //     required String measureType,
// //   });

// //   void updateRetailerParamsHTTP(String simulationId, String retailerName,
// //       {double? strategy, double? sustainabilityRating});

// //   void updateRetailerParamsWS(String simulationId, String retailerName,
// //       {double? strategy, double? sustainabilityRating});

// //   void _updateRetailerStrategy(String retailerName, double strategy) {
// //     var matches = _EntityCatalog.retailers
// //         .where((retailer) => retailer.name == retailerName);
// //     if (matches.isNotEmpty) {
// //       matches.first.strategy = strategy;
// //       notifyListeners();
// //     }
// //   }

// //   void _updateRetailerSustainabilityRating(
// //       String retailerName, double sustainabilityRating) {
// //     var matches = _EntityCatalog.retailers
// //         .where((retailer) => retailer.name == retailerName);
// //     if (matches.isNotEmpty) {
// //       matches.first.sustainability = sustainabilityRating;
// //       notifyListeners();
// //     }
// //   }

// //   Future<EntityModel?> loadEntity(InstitutionModel owner);

// //   EntityModel? _loadEntity(String? data) {
// //     if (data != null) {
// //       var dataMap = jsonDecode(data) as Map<String, dynamic>;

// //       if (dataMap.containsKey('salesHistory')) {
// //         return RetailerModel.fromJson(dataMap);
// //       } else if (dataMap.containsKey('purchaseHistory')) {
// //         return CustomerModel.fromJson(dataMap);
// //       }
// //       return null;
// //     }
// //   }

// //   Future<void> _updateEntityBalances(TransactionModel transaction) async {
// //     if (_EntityCatalog.isNotEmpty) {
// //       final fromEntity = await loadEntity(transaction.accountFrom.owner);
// //       final toEntity = await loadEntity(transaction.accountTo.owner);
// //       if (fromEntity != null) {
// //         _updateEntityInCatalog(fromEntity);
// //       }
// //       if (toEntity != null) {
// //         _updateEntityInCatalog(toEntity);
// //       }
// //       notifyListeners();
// //     }
// //   }

// //   void _updateEntityInCatalog(EntityModel entity) {
// //     if (_EntityCatalog.isNotEmpty) {
// //       if (entity is RetailerModel) {
// //         _EntityCatalog.retailers
// //             .removeWhere((element) => element.id == entity.id);
// //         _EntityCatalog.retailers.add(entity);
// //       } else if (entity is CustomerModel) {
// //         _EntityCatalog.customers
// //             .removeWhere((element) => element.id == entity.id);
// //         _EntityCatalog.customers.add(entity);
// //       } else {
// //         var name = entity.runtimeType.toString();
// //         throw Exception('Unhandled Entity type: $name seen to update catalog.');
// //       }
// //       notifyListeners();
// //     }
// //   }

// //   Future<LoadTransactionsForEntityResult> loadTransactions(String entityId);

// //   LoadTransactionsForEntityResult _loadTransactions(
// //       String entityId, String? data) {
// //     if (data != null) {
// //       final dataMap = jsonDecode(data);
// //       _transactions[entityId] = LoadTransactionsForEntityResult(
// //           transactionsFromEntity: (dataMap['transactionsFromEntity'] as List)
// //               .map((element) =>
// //                   TransactionModel.fromJson(element as Map<String, dynamic>))
// //               .toList(),
// //           transactionsToEntity: (dataMap['transactionsToEntity'] as List)
// //               .map((element) =>
// //                   TransactionModel.fromJson(element as Map<String, dynamic>))
// //               .toList());
// //       notifyListeners();
// //       return _transactions[entityId]!;
// //     }
// //     return LoadTransactionsForEntityResult(
// //         transactionsFromEntity: <TransactionModel>[],
// //         transactionsToEntity: <TransactionModel>[]);
// //   }

// //   Future<LoadSalesForItem> loadSalesForItem(String itemName);

// //   LoadSalesForItem _loadSalesForItem(String itemName, String? data) {
// //     if (data != null) {
// //       final dataMap = jsonDecode(data);
// //       _salesByitem[itemName] = LoadSalesForItem(
// //           salesForItem: (dataMap['transactionsFromEntity'] as List)
// //               .map((element) =>
// //                   SaleModel.fromJson(element as Map<String, dynamic>))
// //               .toList());
// //       notifyListeners();
// //       return _salesByitem[itemName]!;
// //     }
// //     return LoadSalesForItem(salesForItem: <SaleModel>[]);
// //   }

// //   Future<AppTransactionsStateModel> loadAppTransactionsState();

// //   AppTransactionsStateModel _loadAppTransactionsState(String? data) {
// //     if (data != null) {
// //       final dataMap = jsonDecode(data);
// //       _allTransactions = AppTransactionsStateModel.fromJson(
// //           Map<String, dynamic>.from(dataMap));
// //     }
// //     notifyListeners();
// //     return _allTransactions;
// //   }

// //   RunSimulationResponseModel? _loadSimulationEnvironment(String? data) {
// //     try {
// //       if (data != null) {
// //         final dataMap = jsonDecode(data);
// //         final response = RunSimulationResponseModel.fromJson(
// //             Map<String, dynamic>.from(dataMap));
// //         if (response.status == 202 || //HTTPStatus.ACCEPTED
// //             response.message.toLowerCase().contains('simulation ran')) {
// //           _flagStopRunSim(); // simulation ran synchronously on server.
// //         }
// //         _EntityCatalog = response.simulationData.entities;
// //         _simConfig = response.simulationData.simulationConfig;
// //         notifyListeners();
// //         return response;
// //       } else {
// //         _flagStopRunSim();
// //       }
// //     } catch (e) {
// //       _flagStopRunSim();
// //     }
// //     return null;
// //   }

// //   /// A stream manufactured on the [MarketStateViewer] solely responsible for streaming Transactions that
// //   /// the [MarketStateViewer] has processed to consuming widgets.
// //   /// We use a stream instead of listening for updates from notifyListeners as it is more direct.
// //   late Stream<TransactionModel> onTransaction;

// //   late Stream<SimulationProgressData>
// //       onSimulationProgress; //FIXED BUG: Error: Bad State: Stream has already been listened to. Issue:->https://stackoverflow.com/a/51396947 -> (Standard Streams can only be listened to by one Listener at one time, use Broadcast to have multiple) & Solution:->https://stackoverflow.com/a/58245557

// //   double purchaseDelaySeconds = 2.0;

// //   double customerStickyness = 1.0;

// //   void updatePurchaseDelaySpeed(double newSpeed);
// // }

// // enum RequestType { GET, POST }

// // abstract class WebCall {
// //   final Uri uri;
// //   final Map<String, String>? headers;
// //   final RequestType requestType;

// //   WebCall({
// //     required this.uri,
// //     this.headers,
// //     required this.requestType,
// //   });

// //   bool isRequestCall() => (this is WebCallRequest);

// //   bool isResponseCall() => (this is WebCallResponse);
// // }

// // class WebCallRequest extends WebCall {
// //   final Map<String, String>? body;

// //   WebCallRequest({
// //     required uri,
// //     headers,
// //     required requestType,
// //     this.body,
// //   }) : super(uri: uri, requestType: requestType, headers: headers);
// // }

// // class WebCallResponse extends WebCall {
// //   final String? responseBody;
// //   final int statusCode;

// //   WebCallResponse({
// //     required uri,
// //     required this.statusCode,
// //     headers,
// //     required requestType,
// //     this.responseBody,
// //   }) : super(uri: uri, requestType: requestType, headers: headers);
// // }

// mixin HttpRequestMixin on SocketIoMixin, IMarketStateViewer {
//   Uri _addKeyToUri(String url) {
//     final uri = Uri.parse(url);
//     final queryParameters = {
//       'GEMBER_API_KEY': dotenv.env['APPKEY'] ?? '',
//     };
//     queryParameters.addAll(uri.queryParameters);
//     return Uri(
//       scheme: uri.scheme,
//       fragment: uri.fragment,
//       path: uri.path,
//       host: uri.host,
//       port: uri.port,
//       queryParameters: queryParameters,
//       userInfo: uri.userInfo,
//     );
//   }

//   String wsConnectionStatus = 'No Websocket Connection';

//   WebCall? _lastCall;

//   StreamController<WebCall> _callHistoryStreamController =
//       StreamController<WebCall>(
//     onCancel: () {},
//   );

//   Stream<WebCall> get callHistoryStream =>
//       _callHistoryStreamController.stream.asBroadcastStream();

//   WebCall? get lastCall => _lastCall;

//   Future<T?> getDataAndDecodeTyped<T>(String url,
//       {Map<String, String>? headers, Map<String, String>? queryParams}) async {
//     final response =
//         await getData(url, headers: headers, queryParams: queryParams);
//     if (response != null) {
//       try {
//         final T decoded = jsonDecode(response);
//         return decoded;
//       } catch (err) {
//         rethrow;
//       }
//     } else {
//       return null;
//     }
//   }

//   void logCallRequest(
//       {required Uri uri,
//       required RequestType requestType,
//       Map<String, String>? headers,
//       Map<String, String>? body}) {
//     _lastCall = WebCallRequest(
//         uri: uri, requestType: requestType, headers: headers, body: body);
//     if (_callHistoryStreamController.hasListener) {
//       _callHistoryStreamController.sink.add(_lastCall!);
//     }
//     // notifyListeners();
//   }

//   void logCallResponse(
//       {required Uri uri,
//       required RequestType requestType,
//       required int statusCode,
//       Map<String, String>? headers,
//       String? body}) {
//     _lastCall = WebCallResponse(
//         uri: uri,
//         requestType: requestType,
//         statusCode: statusCode,
//         headers: headers,
//         responseBody: body);
//     if (_callHistoryStreamController.hasListener) {
//       _callHistoryStreamController.sink.add(_lastCall!);
//     }
//     // notifyListeners();
//   }

//   Future<String?> getData(String url,
//       {Map<String, String>? headers, Map<String, String>? queryParams}) async {
//     _flagStartHttpCall;
//     var uri = _addKeyToUri(url);
//     if (queryParams != null) {
//       uri.queryParameters.addAll(queryParams);
//     }

//     log.fine(PrintPens.orangePen('[GET]: Calling uri: $uri'));
//     http.Response response;

//     try {
//       logCallRequest(
//           uri: uri,
//           requestType: RequestType.GET,
//           headers: headers,
//           body: queryParams);
//       response = await httpClient.get(uri, headers: headers);
//       _flagStopHttpCall;
//       logCallResponse(
//           uri: uri,
//           requestType: RequestType.GET,
//           statusCode: response.statusCode,
//           headers: response.headers,
//           body: response.body);
//       if (backendServerDead) {
//         backendServerDead = false;
//         notifyListeners();
//       }
//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         log.fine(PrintPens.orangePen('[GET]: Received response for: $uri'));
//         return response.body;
//       } else {
//         log.fine(response.statusCode);
//         return null;
//       }
//     } catch (e) {
//       _flagStopHttpCall;
//       log.fine("[GET ERROR]: Calling uri: $uri: ${e}");
//       log.fine(e);
//     }
//   }

//   Future<String?> postData(String url, Map<String, dynamic> postData) async {
//     _flagStartHttpCall;
//     final uri = _addKeyToUri(url);
//     Map<String, String> headers = HashMap();
//     headers['Accept'] = 'application/json';

//     log.fine(PrintPens.orangePen('[POST]: Calling uri: $uri'));
//     try {
//       /* [body] sets the body of the request. It can be a [String], a [List] or a [Map<String, String>]. If it's a String, it's encoded using [encoding] and used as the body of the request. The content-type of the request will default to "text/plain".

//         If [body] is a List, it's used as a list of bytes for the body of the request.

//         If [body] is a Map, it's encoded as form fields using [encoding]. The content-type of the request will be set to "application/x-www-form-urlencoded"; this cannot be overridden.

//         [encoding] defaults to [utf8].*/
//       var _strPostData = <String, String>{};
//       try {
//         _strPostData = Map<String, String>.fromEntries(postData.entries
//             .map((entry) => MapEntry(entry.key, entry.value.toString())));
//       } catch (e) {
//         log.warning(
//             'Was unable to convert postData body to Map<String,String> with errMsg: $e');
//       }

//       logCallRequest(
//           uri: uri,
//           requestType: RequestType.POST,
//           headers: headers,
//           body: _strPostData);

//       final response = await httpClient.post(
//         uri,
//         body: _strPostData,
//       );
//       _flagStopHttpCall;
//       logCallResponse(
//           uri: uri,
//           requestType: RequestType.GET,
//           statusCode: response.statusCode,
//           headers: response.headers,
//           body: response.body);

//       if (backendServerDead) {
//         backendServerDead = false;
//         notifyListeners();
//       }

//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         log.fine(PrintPens.orangePen('[POST]: Received response for: $uri'));
//         return response.body;
//       } else {
//         log.fine(PrintPens.peachPen(
//             'App need to handle HTTP Response Status Code: ${response.statusCode}'));
//         return null;
//       }

//       // } on XMLHttpRequestError catch (e) {
//       //   log.fine(e.message);
//     } catch (e) {
//       _flagStopHttpCall;
//       backendServerDead = true;
//       notifyListeners();
//       log.fine("[POST ERROR]: Calling uri: $uri: ${e}");
//       log.fine(
//           'May need to restart python server as issue when closing this app that kills the socket and errors in flask app');
//       channels.forEach((element) => element.tryReconnect());
//     }
//   }
// }

// // class MarketStateViewer extends SocketIoMixin with HttpRequestMixin {
// //   factory MarketStateViewer.create() {
// //     _instance ??= MarketStateViewer._privateConstruct();
// //     return _instance!;
// //   }

// //   static const socketIoUrl = SocketIoMixin.socketIoUrl;

// //   bool loadingEntities = false;

// //   MarketStateViewer._privateConstruct() {
// //     onTransaction = _transactionEmitterController.stream.asBroadcastStream();
// //     onSimulationProgress =
// //         _simulationProgressEmitterController.stream.asBroadcastStream();

// //     onInit(onReconnect: () {
// //       if (appStateMgr.initialised) {
// //         return;
// //       }
// //       initialiseGemberPointsApp().then((appLoaded) {
// //         if (appLoaded) {
// //           return loadRetailerNames();
// //         } else {
// //           return Future.value(null);
// //         }
// //       }).then(
// //         (retailerNamesHttp) {
// //           retailerNames = retailerNamesHttp ?? <String>[];
// //         },
// //       );
// //     });

// //     // if (webSocketConnected) {
// //     //   wsConnectionStatus = globalNspChannel.connectionStatus;
// //     //   notifyListeners();
// //     // }

// //     // checkClientAcceptsWSEventNames().then((inSync) {
// //     //   eventNamesClientSendsToServerSynced = inSync;
// //     //   notifyListeners();
// //     // });

// //     // eventNamesServerSendsToClientSynced = true;
// //     // checkServerResponseWSEventNames().then((inSync) {
// //     //   eventNamesServerSendsToClientSynced = inSync;
// //     //   notifyListeners();
// //     // });
// //   }

// //   @override
// //   void dispose() {
// //     onDispose();
// //     super.dispose();
// //   }

// //   // Stream<TransactionModel> registerWSSTransactionConn() {
// //   //   _transactionEmitterController.onListen = () {
// //   //     onTransactionsListenerAdded();
// //   //   };

// //   //   _transactionEmitterController.onCancel = () {
// //   //     if (!_transactionEmitterController.hasListener) {
// //   //       channel.sink.close();
// //   //       onAllTransactionsListenersCancelled();
// //   //     }
// //   //   };

// //   //   return _transactionEmitterController.stream.asBroadcastStream();
// //   // }

// //   // Stream<SimulationProgressData> registerWSSSimulationProgressStream() {
// //   //   _simulationProgressEmitterController.onCancel = () {};
// //   //   _simulationProgressEmitterController.onCancel = () {};

// //   //   return _simulationProgressEmitterController.stream.asBroadcastStream();
// //   // }

// //   Future<bool> checkServerResponseWSEventNames() async {
// //     final eventNamesResponse =
// //         await getData('$apiUrl/ws/event-response-names-cat');
// //     if (eventNamesResponse != null) {
// //       final data = Map<String, dynamic>.from(jsonDecode(eventNamesResponse));
// //       final eventNamesList = data['data'] as List<String>;

// //       bool allMatchServerInFlutter = true;
// //       // Check all event names according to server are accounted for in flutter front end
// //       for (final event in eventNamesList) {
// //         allMatchServerInFlutter =
// //             !WebSocketServerResponseEvent.all_members.contains(event);
// //       }

// //       bool allMatchFlutterOnServer = true;
// //       // Check all event names according to flutter front end are accounted for on server
// //       for (final event in WebSocketServerResponseEvent.all_members) {
// //         allMatchFlutterOnServer = !eventNamesList.contains(event);
// //       }
// //       return (allMatchFlutterOnServer && allMatchServerInFlutter);
// //     } else {
// //       return false;
// //     }
// //   }

// //   Future<bool> checkClientAcceptsWSEventNames() async {
// //     final eventNamesResponse = await getData('$apiUrl/ws/event-names-cat');
// //     if (eventNamesResponse != null) {
// //       final data = Map<String, dynamic>.from(jsonDecode(eventNamesResponse));
// //       final eventNamesList = data['data'] as List<String>;

// //       bool allMatchServerInFlutter = true;
// //       // Check all event names according to server are accounted for in flutter front end
// //       for (final event in eventNamesList) {
// //         allMatchServerInFlutter =
// //             !WebSocketClientEvent.all_members.contains(event);
// //       }

// //       bool allMatchFlutterOnServer = true;
// //       // Check all event names according to flutter front end are accounted for on server
// //       for (final event in WebSocketClientEvent.all_members) {
// //         allMatchFlutterOnServer = !eventNamesList.contains(event);
// //       }
// //       return (allMatchFlutterOnServer && allMatchServerInFlutter);
// //     } else {
// //       return false;
// //     }
// //   }

// //   void onTransactionsListenerAdded() {
// //     // add handlers
// //   }

// //   void onAllTransactionsListenersCancelled() {}

// //   static MarketStateViewer? _instance;

// //   @override
// //   Future<GemberAppConfig> loadGemberAppConfig(String simulationId) async {
// //     final data =
// //         await postData('$apiUrl/app-config', {'simulation_id': simulationId});
// //     //dont implement on websocket, these config params should be a front end parameter only for using to post for new simulations.
// //     return _loadGemberAppConfig(data);
// //   }

// //   @override
// //   Future<LoadSalesForItem> loadSalesForItem(String itemName) async {
// //     final data = await getData('$apiUrl/item-sales?item-name=$itemName');
// //     return _loadSalesForItem(itemName, data);
// //   }

// //   @override
// //   Future<LoadTransactionsForEntityResult> loadTransactions(
// //       String entityId) async {
// //     final data = await getData('$apiUrl/transactions?entityid=$entityId');
// //     return _loadTransactions(entityId, data);
// //   }

// //   @override
// //   void testWsConnMemory() async {
// //     final data = await getData('$apiUrl/test-ws-event-memory');
// //     return;
// //   }

// //   @override
// //   Future<bool> initialiseGemberPointsApp() async {
// //     final data = await postData('$apiUrl/init-lazy', {});
// //     return _checkInitAppResponseOK(data);
// //   }

// //   @override
// //   Future<LoadEntitiesResult> loadEntities(
// //       {GemberAppConfig? configOptions}) async {
// //     // if (_EntityCatalog.isEmpty && !loadingEntities) {
// //     // }
// //     loadingEntities = true;
// //     try {
// //       final data = await postData(
// //           '$apiUrl/load-entities', configOptions?.toStrJson() ?? {});
// //       _loadEntities(data);
// //     } finally {
// //       loadingEntities = false;
// //     }
// //     _requestPurchaseSpeed();
// //     return _EntityCatalog;
// //   }

// //   @override
// //   Future<EntityModel?> loadEntity(InstitutionModel owner) async {
// //     final data =
// //         await postData('$apiUrl/entity', {'name': owner.name, 'id': owner.id});
// //     return _loadEntity(data);
// //   }

// //   _requestPurchaseSpeed() async {
// //     // _emitToWSServer(jsonEncode(
// //     //     <String, dynamic>{'type': 'get purchase delay', 'data': 'null'}));
// //     emitToWSServer(type: 'get purchase delay', data: 'null');
// //   }

// //   @override
// //   void updatePurchaseDelaySpeed(double newSpeed) async {
// //     if (globalNspChannel.isClosed == false) {
// //       emitToWSServer(
// //           type: WebSocketClientEvent.change_purchase_delay, data: newSpeed);
// //       _requestPurchaseSpeed();
// //     }
// //   }

// //   @override
// //   void updateRetailerParamsHTTP(String simulationId, String retailerName,
// //       {double? strategy, double? sustainabilityRating}) async {
// //     var options = {
// //       'simulation_id': simulationId,
// //       'retailer_name': retailerName,
// //     };
// //     if (strategy != null) {
// //       options['retailer_strategy'] = '$strategy';
// //     }
// //     if (sustainabilityRating != null) {
// //       options['retailer_sustainability'] = '$sustainabilityRating';
// //     }
// //     var response = await postData('$apiUrl/adjust-retailer', options);
// //   }

// //   @override
// //   void updateRetailerParamsWS(String simulationId, String retailerName,
// //       {double? strategy, double? sustainabilityRating}) {
// //     var options = {
// //       'simulation_id': simulationId,
// //       'retailer_name': retailerName,
// //     };
// //     if (strategy != null) {
// //       options['retailer_strategy'] = '$strategy';
// //     }
// //     if (sustainabilityRating != null) {
// //       options['retailer_sustainability'] = '$sustainabilityRating';
// //     }
// //     if (globalNspChannel.isClosed == false) {
// //       emitToWSServer(
// //           type: WebSocketClientEvent.change_retailer_strategy, data: options);
// //     }
// //   }

// //   // @override
// //   // Future<SimulationTokenModel?> initialiseNewSimulationEnvironment({
// //   //   required GemberAppConfig configOptions,
// //   //   required ControlRetailerModel retailer,
// //   //   required double convergenceThreshold,
// //   //   required int maxN,
// //   // }) async {
// //   //   var params = <String, String>{
// //   //     'convergenceTH': "$convergenceThreshold",
// //   //     'maxN': "$maxN",
// //   //     'retailer_name': retailer.name,
// //   //     'retailer_strategy': 'COMPETITIVE',
// //   //     'retailer_sustainability': 'AVERAGE',
// //   //   };
// //   //   params.addAll(configOptions.toStrJson());
// //   //   final response = await postData('$apiUrl/init-new-sim', params);
// //   //   return _getSimulationIdFromResponse(response);
// //   // }

// //   // @override
// //   // Future<SimulationTokenModel?> initialiseNewRealtimeScenarioEnvironment({
// //   //   required GemberAppConfig configOptions,
// //   // }) async {
// //   //   var params = configOptions.toStrJson();
// //   //   final response = await postData('$apiUrl/init-new-sim', params);
// //   //   return _getSimulationIdFromResponse(response);
// //   // }

// //   @override
// //   Future<T?> getTaskResult<T extends TSerializable>(
// //       String taskId, T Function(dynamic jsonDecoded) fromJson) async {
// //     final response = await postData('$apiUrl/task-result', {
// //       'taskId': taskId,
// //     });
// //     if (response != null) {
// //       final jsonDecoded = jsonDecode(response);
// //       return fromJson(jsonDecoded);
// //     } else {
// //       return null;
// //     }
// //   }

// //   @override
// //   Future<RunSimulationResponseModel?> runIsolatedSimIteration({
// //     required GemberAppConfig configOptions,
// //   }) async {
// //     _flagStartRunSim();
// //     final response = await postData('$apiUrl/run-single-iteration', {
// //       ...configOptions.toJson(),
// //     });
// //     _flagStopRunSim();
// //     return _loadSimulationEnvironment(
// //         response); // taskid, simulationid, simulationtype and message
// //   }

// //   @override
// //   Future<RunSimulationResponseModel?> runRealTimeScenario({
// //     required GemberAppConfig configOptions,
// //   }) async {
// //     _flagStartRunSim();
// //     final response = await postData('$apiUrl/run-scenario', {
// //       ...configOptions.toJson(),
// //     });
// //     return _loadSimulationEnvironment(response);
// //   }

// //   @override
// //   Future<RunSimulationResponseModel?> runFullSimulation({
// //     required GemberAppConfig configOptions,
// //   }) async {
// //     _flagStartRunSim();
// //     final response = await postData('$apiUrl/run-full-sim', {
// //       ...configOptions.toJson(),
// //     });
// //     return _loadSimulationEnvironment(response);
// //   }

// //   @override
// //   Future<AppTransactionsStateModel> loadAppTransactionsState() async {
// //     final response = await getData('$apiUrl/transactionsState');
// //     return _loadAppTransactionsState(response);
// //   }

// //   @override
// //   Future<SimulationResult?> getSimulationResult(
// //       {required String simulationId}) async {
// //     final response = await getData('$apiUrl/sim-result',
// //         queryParams: {'simulationId': simulationId});
// //     throw UnimplementedError();
// //     // return _parseSimulationProgressData(response);
// //   }

// //   @override
// //   Future<SimulationComparisonHistory?> getSimulationComparisonHistory({
// //     required List<String> simulationIds,
// //     required String retailerName,
// //     required String measureType,
// //   }) async {
// //     final response = await getData('$apiUrl/sim-compare', queryParams: {
// //       'simulationIds': simulationIds.join(','),
// //       'retailerName': retailerName,
// //       'measureType': measureType,
// //     });
// //     throw UnimplementedError();
// //     // return _parseSimulationProgressData(response);
// //   }

// //   @override
// //   Future<List<String>> loadRetailerNames() async {
// //     final response = await getData('$apiUrl/retailer_names');
// //     if (response == null) {
// //       return <String>[];
// //     } else {
// //       final data = jsonDecode(response);
// //       return List<String>.from(data['retailer_names']);
// //     }
// //   }
// // }

// // class MarketStateViewerMock extends IMarketStateViewer {
// //   factory MarketStateViewerMock.create() {
// //     _instance ??= MarketStateViewerMock._privateConstruct();
// //     return _instance!;
// //   }

// //   final randomGenerator = math.Random();

// //   bool _keepStreamingTransactons = true;

// //   MarketStateViewerMock._privateConstruct() {
// //     purchaseDelaySeconds = 2.0;
// //     _keepStreamingTransactons = true;
// //     onTransaction = regularTransactionMockCreatorSync(
// //             Duration(milliseconds: (purchaseDelaySeconds * 1000.0).round()))
// //         .stream
// //         .asBroadcastStream();
// //     // onSimulationProgress =

// //     eventNamesClientSendsToServerSynced = true;
// //     eventNamesServerSendsToClientSynced = true;
// //   }

// //   @override
// //   void updatePurchaseDelaySpeed(double newSpeed) async {
// //     purchaseDelaySeconds = newSpeed;
// //     _keepStreamingTransactons = false;
// //     _flagStartHttpCall;
// //     await Future.delayed(Duration(seconds: 1));
// //     _flagStopHttpCall;
// //     _keepStreamingTransactons = true;
// //     onTransaction = regularTransactionMockCreatorSync(
// //             Duration(milliseconds: (purchaseDelaySeconds * 1000.0).round()))
// //         .stream
// //         .asBroadcastStream();
// //   }

// //   @override
// //   void testWsConnMemory() {
// //     return;
// //   }

// //   Stream<TransactionModel> regularTransactionMockCreator(Duration interval,
// //       [int? maxCount]) async* {
// //     int i = 0;
// //     while (true) {
// //       await Future.delayed(interval);
// //       if (_EntityCatalog.isNotEmpty) {
// //         var t = TransactionModel(
// //           accountFrom: BankAccountModelLight(
// //             "account_from_id_please_set",
// //             owner: InstitutionModel(
// //                 name: _EntityCatalog.customers[0].name,
// //                 id: _EntityCatalog.customers[0].id),
// //             bank: InstitutionModel(name: "AMEX_BANK", id: 'AMEX_BANK_ID'),
// //             fiatCurrency: 'GBP',
// //             balance: BankAccountViewModel.dummy(),
// //           ),
// //           accountTo: BankAccountModelLight(
// //             "account_to_id_please_set",
// //             owner: InstitutionModel(
// //                 name: _EntityCatalog.retailers[0].name,
// //                 id: _EntityCatalog.retailers[0].id),
// //             bank: InstitutionModel(name: "AMEX_BANK", id: 'AMEX_BANK_ID'),
// //             fiatCurrency: 'GBP',
// //             balance: BankAccountViewModel.dummy(),
// //           ),
// //           money: CostModel(1.0, 'GBP'),
// //           ether: EtherPaymentModel(
// //               ether: CoinModel(0.0001),
// //               gas: CoinModel(0.000001),
// //               money: CostModel(0.0, 'GBP')),
// //           greenPoints: GreenPointsPaymentModel(
// //             greenPoints: CoinDetailModel(
// //                 amount: 5.0,
// //                 tokenValueInPeggedCurrency: 0.01,
// //                 valueInPeggedCurrency: CostModel(0.05, 'GBP'),
// //                 peggedCurrency: 'GBP'),
// //             gas: CoinModel(0.00000025),
// //             money: CostModel(0.0, 'GBP'),
// //           ),
// //         );
// //         yield t;
// //         _updateEntityBalancesMock(t);
// //         if (i == maxCount) break;
// //       }
// //     }
// //   }

// //   StreamController<TransactionModel> regularTransactionMockCreatorSync(
// //       Duration interval,
// //       [int? maxCount]) {
// //     bool ticking = false;
// //     Timer? controllerLoop;
// //     StreamController<TransactionModel>? controller;
// //     int counter = 0;
// //     void tick(Timer timer) {
// //       ticking = true;
// //       if (controller == null) {
// //         timer.cancel();
// //         ticking = false;
// //         return;
// //       }
// //       if (_EntityCatalog.isNotEmpty) {
// //         var iCust = randomGenerator.nextInt(_EntityCatalog.customers.length);
// //         var iRetlr = randomGenerator.nextInt(_EntityCatalog.retailers.length);
// //         var t = TransactionModel(
// //           accountFrom: BankAccountModelLight(
// //             "account_from_id_please_set",
// //             owner: InstitutionModel(
// //                 name: _EntityCatalog.customers[iCust].name,
// //                 id: _EntityCatalog.customers[iCust].id),
// //             bank: InstitutionModel(name: "AMEX_BANK", id: 'AMEX_BANK_ID'),
// //             fiatCurrency: 'GBP',
// //             balance: BankAccountViewModel.dummy(),
// //           ),
// //           accountTo: BankAccountModelLight(
// //             "account_to_id_please_set",
// //             owner: InstitutionModel(
// //                 name: _EntityCatalog.retailers[iRetlr].name,
// //                 id: _EntityCatalog.retailers[iRetlr].id),
// //             bank: InstitutionModel(name: "AMEX_BANK", id: 'AMEX_BANK_ID'),
// //             fiatCurrency: 'GBP',
// //             balance: BankAccountViewModel.dummy(),
// //           ),
// //           money: CostModel(1.0, 'GBP'),
// //           ether: EtherPaymentModel(
// //               ether: CoinModel(0.0001),
// //               gas: CoinModel(0.000001),
// //               money: CostModel(0.0, 'GBP')),
// //           greenPoints: GreenPointsPaymentModel(
// //             greenPoints: CoinDetailModel(
// //                 amount: 5.0,
// //                 tokenValueInPeggedCurrency: 0.01,
// //                 valueInPeggedCurrency: CostModel(0.05, 'GBP'),
// //                 peggedCurrency: 'GBP'),
// //             gas: CoinModel(0.00000025),
// //             money: CostModel(0.0, 'GBP'),
// //           ),
// //         );
// //         controller.add(t); // Ask stream to send transaction values as event.;
// //         _updateEntityBalancesMock(t);
// //         if (maxCount != null && counter >= maxCount) {
// //           timer.cancel();
// //           ticking = false;
// //           controller.close(); // Ask stream to shut down and tell listeners.
// //         }
// //       }
// //     }

// //     controller = StreamController<TransactionModel>(onCancel: () {
// //       if (ticking) {
// //         controllerLoop?.cancel();
// //         ticking = false;
// //       }
// //     }, onListen: () {
// //       if (!ticking) {
// //         controllerLoop = Timer.periodic(interval, tick);
// //       }
// //     });

// //     return controller;
// //   }

// //   Future<void> _updateEntityBalancesMock(TransactionModel transaction) async {
// //     if (_EntityCatalog.isNotEmpty) {
// //       _flagStartHttpCall;
// //       final fromEntity = await loadEntity(transaction.accountFrom.owner);
// //       final toEntity = await loadEntity(transaction.accountTo.owner);
// //       _flagStopHttpCall;
// //       CostModel? addMoney;
// //       if (transaction.money.amount != 0) {
// //         addMoney = transaction.money;
// //       }
// //       double? addGP;
// //       if (transaction.greenPoints.greenPoints.amount != 0) {
// //         addGP = transaction.greenPoints.greenPoints.amount;
// //       }
// //       if (fromEntity != null) {
// //         _updateEntity(fromEntity, addMoney: addMoney, addGP: addGP);
// //         _updateEntityInCatalog(fromEntity);
// //       }

// //       if (transaction.money.amount != 0) {
// //         addMoney = CostModel(
// //             transaction.money.amount * -1, transaction.money.currency);
// //       }
// //       if (addGP != null) {
// //         addGP *= -1;
// //       }
// //       if (toEntity != null) {
// //         _updateEntity(toEntity, addMoney: addMoney, addGP: addGP);
// //         _updateEntityInCatalog(toEntity);
// //       }

// //       notifyListeners();
// //     }
// //   }

// //   @override
// //   String connectionStatus = 'Mock ws -> N/A';

// //   static MarketStateViewerMock? _instance;

// //   @override
// //   Future<LoadSalesForItem> loadSalesForItem(String itemName) async {
// //     _flagStartHttpCall;
// //     var data = await rootBundle.loadString('mock_data/sales_for_item.json');
// //     _flagStopHttpCall;
// //     return _loadSalesForItem(itemName, data);
// //   }

// //   @override
// //   Future<LoadTransactionsForEntityResult> loadTransactions(
// //       String entityId) async {
// //     _flagStartHttpCall;
// //     var data =
// //         await rootBundle.loadString('mock_data/transactions_for_entity.json');
// //     _flagStopHttpCall;
// //     return _loadTransactions(entityId, data);
// //   }

// //   @override
// //   Future<void> pollUpdates() async {
// //     throw Exception('Not implemented for Mock Service yet.');
// //   }

// //   @override
// //   Future<bool> initialiseGemberPointsApp() async {
// //     return true;
// //   }

// //   @override
// //   Future<LoadEntitiesResult> loadEntities(
// //       {GemberAppConfig? configOptions}) async {
// //     if (_EntityCatalog.isEmpty) {
// //       _flagStartHttpCall;
// //       var data = await rootBundle.loadString('mock_data/entities.json');
// //       _flagStopHttpCall;
// //       _loadEntities(data);
// //       if (configOptions != null) {
// //         if (_EntityCatalog.customers.length < configOptions.NUM_CUSTOMERS &&
// //             _EntityCatalog.customers.isNotEmpty) {
// //           CustomerModel copyCust(int i) {
// //             var custCopy = _EntityCatalog.customers.first.toJson();
// //             custCopy['name'] = 'Copied Customer [$i]';
// //             return CustomerModel.fromJson(custCopy['name']);
// //           }

// //           var additionalCustomers =
// //               List<int>.generate(10, (i) => i + 1).map(copyCust);

// //           _EntityCatalog.customers.addAll(additionalCustomers);
// //         } else if (_EntityCatalog.customers.length >
// //             configOptions.NUM_CUSTOMERS) {
// //           _EntityCatalog.customers.removeRange(
// //               configOptions.NUM_CUSTOMERS, _EntityCatalog.customers.length);
// //         }
// //       }
// //     }
// //     return _EntityCatalog;
// //   }

// //   @override
// //   Future<GemberAppConfig> loadGemberAppConfig(String simulationId) {
// //     return Future.value(GemberAppConfig.fromJson(<String, int>{
// //       'BASKET_FULL_SIZE': 2,
// //       'NUM_SHOP_TRIPS_PER_ITERATION': 3,
// //       'NUM_CUSTOMERS': 4,
// //     }));
// //   }

// //   // @override
// //   // Future<SimulationTokenModel?> initialiseNewSimulationEnvironment(
// //   //     {required GemberAppConfig configOptions,
// //   //     required ControlRetailerModel retailer,
// //   //     required double convergenceThreshold,
// //   //     required int maxN}) {
// //   //   throw Exception('Not implemented for Mock Service yet.');
// //   // }

// //   // @override
// //   // Future<SimulationTokenModel?> initialiseNewRealtimeScenarioEnvironment({
// //   //   required GemberAppConfig configOptions,
// //   // }) {
// //   //   throw Exception('Not implemented for Mock Service yet.');
// //   // }

// //   void _updateEntity(EntityModel entity, {CostModel? addMoney, double? addGP}) {
// //     if (_EntityCatalog.customers
// //         .where((element) => element.id == entity.id)
// //         .toList()
// //         .isNotEmpty) {
// //       var customer = _EntityCatalog.customers
// //           .firstWhere((element) => element.id == entity.id);
// //       _EntityCatalog.customers.remove(customer);
// //       var greenPointsFactor =
// //           customer.balance.greenPointsMonetaryValue.amount > 0
// //               ? customer.balance.greenPoints /
// //                   customer.balance.greenPointsMonetaryValue.amount
// //               : 0.0;
// //       if (addMoney != null) {
// //         customer = CustomerModel(
// //           balance: BankAccountViewModel(
// //             viewCurrency: customer.balance.viewCurrency,
// //             underlyingCurrency: customer.balance.underlyingCurrency,
// //             combinedBalance: CostModel(
// //                 customer.balance.combinedBalance.amount + addMoney.amount,
// //                 customer.balance.combinedBalance.currency),
// //             greenPoints: customer.balance.greenPoints,
// //             greenPointsMonetaryValue: customer.balance.greenPointsMonetaryValue,
// //             moneyBalance: CostModel(
// //                 customer.balance.moneyBalance.amount + addMoney.amount,
// //                 customer.balance.moneyBalance.currency),
// //           ),
// //           balanceMoney: CostModel(
// //               customer.balanceMoney.amount + addMoney.amount,
// //               customer.balanceMoney.currency),
// //           bank: customer.bank,
// //           name: customer.name,
// //           basket: customer.basket,
// //           id: customer.id,
// //           purchaseHistory: customer.purchaseHistory,
// //         );
// //       }
// //       if (addGP != null) {
// //         customer = CustomerModel(
// //           balance: BankAccountViewModel(
// //             viewCurrency: customer.balance.viewCurrency,
// //             underlyingCurrency: customer.balance.underlyingCurrency,
// //             combinedBalance: CostModel(
// //                 customer.balance.combinedBalance.amount +
// //                     (addGP * greenPointsFactor),
// //                 customer.balance.combinedBalance.currency),
// //             greenPoints: customer.balance.greenPoints + addGP,
// //             greenPointsMonetaryValue: CostModel(
// //                 customer.balance.greenPointsMonetaryValue.amount +
// //                     (addGP * greenPointsFactor),
// //                 customer.balance.greenPointsMonetaryValue.currency),
// //             moneyBalance: CostModel(customer.balance.moneyBalance.amount,
// //                 customer.balance.moneyBalance.currency),
// //           ),
// //           balanceMoney: CostModel(
// //               customer.balanceMoney.amount, customer.balanceMoney.currency),
// //           bank: customer.bank,
// //           name: customer.name,
// //           basket: customer.basket,
// //           id: customer.id,
// //           purchaseHistory: customer.purchaseHistory,
// //         );
// //       }
// //       _EntityCatalog.customers.add(customer);
// //     } else if (_EntityCatalog.retailers
// //         .where((element) => element.id == entity.id)
// //         .toList()
// //         .isNotEmpty) {
// //       var retailer = _EntityCatalog.retailers
// //           .firstWhere((element) => element.id == entity.id);
// //       _EntityCatalog.retailers.remove(retailer);
// //       var greenPointsFactor =
// //           retailer.balance.greenPointsMonetaryValue.amount > 0
// //               ? retailer.balance.greenPoints /
// //                   retailer.balance.greenPointsMonetaryValue.amount
// //               : 0.0;
// //       if (addMoney != null) {
// //         retailer = RetailerModel(
// //           balance: BankAccountViewModel(
// //             viewCurrency: retailer.balance.viewCurrency,
// //             underlyingCurrency: retailer.balance.underlyingCurrency,
// //             combinedBalance: CostModel(
// //                 retailer.balance.combinedBalance.amount + addMoney.amount,
// //                 retailer.balance.combinedBalance.currency),
// //             greenPoints: retailer.balance.greenPoints,
// //             greenPointsMonetaryValue: retailer.balance.greenPointsMonetaryValue,
// //             moneyBalance: CostModel(
// //                 retailer.balance.moneyBalance.amount + addMoney.amount,
// //                 retailer.balance.moneyBalance.currency),
// //           ),
// //           balanceMoney: CostModel(
// //               retailer.balanceMoney.amount + addMoney.amount,
// //               retailer.balanceMoney.currency),
// //           strategy: RetailerStrategy.COMPETITIVE,
// //           sustainability: RetailerSustainability.AVERAGE,
// //           bank: retailer.bank,
// //           name: retailer.name,
// //           id: retailer.id,
// //           salesHistory: retailer.salesHistory,
// //           totalSales: retailer.totalSales,
// //         );
// //       }
// //       if (addGP != null) {
// //         retailer = RetailerModel(
// //           balance: BankAccountViewModel(
// //             viewCurrency: retailer.balance.viewCurrency,
// //             underlyingCurrency: retailer.balance.underlyingCurrency,
// //             combinedBalance: CostModel(
// //                 retailer.balance.combinedBalance.amount +
// //                     (addGP * greenPointsFactor),
// //                 retailer.balance.combinedBalance.currency),
// //             greenPoints: retailer.balance.greenPoints + addGP,
// //             greenPointsMonetaryValue: CostModel(
// //                 retailer.balance.greenPointsMonetaryValue.amount +
// //                     (addGP * greenPointsFactor),
// //                 retailer.balance.greenPointsMonetaryValue.currency),
// //             moneyBalance: CostModel(retailer.balance.moneyBalance.amount,
// //                 retailer.balance.moneyBalance.currency),
// //           ),
// //           balanceMoney: CostModel(
// //               retailer.balanceMoney.amount, retailer.balanceMoney.currency),
// //           strategy: RetailerStrategy.COMPETITIVE,
// //           sustainability: RetailerSustainability.AVERAGE,
// //           bank: retailer.bank,
// //           name: retailer.name,
// //           id: retailer.id,
// //           salesHistory: retailer.salesHistory,
// //           totalSales: retailer.totalSales,
// //         );
// //       }
// //       _EntityCatalog.retailers.add(retailer);
// //     }
// //   }

// //   @override
// //   Future<EntityModel?> loadEntity(InstitutionModel owner) async {
// //     if (_EntityCatalog.customers
// //         .where((element) => element.id == owner.id)
// //         .toList()
// //         .isNotEmpty) {
// //       var customer = _EntityCatalog.customers
// //           .firstWhere((element) => element.id == owner.id);
// //       return customer;
// //     } else if (_EntityCatalog.retailers
// //         .where((element) => element.id == owner.id)
// //         .toList()
// //         .isNotEmpty) {
// //       var retailer = _EntityCatalog.retailers
// //           .firstWhere((element) => element.id == owner.id);
// //       return retailer;
// //     }
// //   }

// //   @override
// //   Future<AppTransactionsStateModel> loadAppTransactionsState() async {
// //     _flagStartHttpCall;
// //     var data = await rootBundle.loadString('mock_data/appTransactions.json');
// //     _flagStopHttpCall;
// //     return _loadAppTransactionsState(data);
// //   }

// //   @override
// //   void updateRetailerParamsHTTP(String simulationId, String retailerName,
// //       {double? strategy, double? sustainabilityRating}) {
// //     if (strategy != null) {
// //       _updateRetailerStrategy(retailerName, strategy);
// //     }
// //     if (sustainabilityRating != null) {
// //       _updateRetailerSustainabilityRating(retailerName, sustainabilityRating);
// //     }
// //   }

// //   @override
// //   void updateRetailerParamsWS(String simulationId, String retailerName,
// //       {double? strategy, double? sustainabilityRating}) {
// //     updateRetailerParamsHTTP(simulationId, retailerName,
// //         strategy: strategy, sustainabilityRating: sustainabilityRating);
// //   }

// //   @override
// //   Future<T?> getTaskResult<T extends TSerializable>(
// //       String taskId, T Function(dynamic jsonDecoded) fromJson) {
// //     // TODO: implement getTaskResult
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<RunSimulationResponseModel?> runFullSimulation({
// //     required GemberAppConfig configOptions,
// //   }) {
// //     // TODO: implement runFullSimulation
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<RunSimulationResponseModel?> runIsolatedSimIteration(
// //       {required GemberAppConfig configOptions}) {
// //     // TODO: implement runIsolatedSimIteration
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<RunSimulationResponseModel?> runRealTimeScenario(
// //       {required GemberAppConfig configOptions}) {
// //     // TODO: implement runRealTimeScenario
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<SimulationResult?> getSimulationResult(
// //       {required String simulationId}) {
// //     // TODO: implement getSimulationResult
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<SimulationComparisonHistory?> getSimulationComparisonHistory(
// //       {required List<String> simulationIds,
// //       required String retailerName,
// //       required String measureType}) {
// //     // TODO: implement getSimulationComparisonHistory
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<List<String>> loadRetailerNames() {
// //     return Future.value(_EntityCatalog.retailers.map((r) => r.name).toList());
// //   }
// // }

// // class MarketStateViewerFactory {
// //   factory MarketStateViewerFactory.create([bool mock = true]) {
// //     if (mock) {
// //       _instance ??= MarketStateViewerFactory._privateConstruct(
// //           null, MarketStateViewerMock.create());
// //     } else {
// //       _instance ??= MarketStateViewerFactory._privateConstruct(
// //           MarketStateViewer.create(), null);
// //     }
// //     return _instance!;
// //   }

// //   MarketStateViewerFactory._privateConstruct(
// //     this.realInstance,
// //     this.mockInstance,
// //   );

// //   static MarketStateViewerFactory? _instance;

// //   final MarketStateViewer? realInstance;
// //   final MarketStateViewerMock? mockInstance;
// // }
