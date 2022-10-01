
// import '../model/all_models.dart';

// class MockService implements ServiceInterface<CustomerModel> {
//   static MockService create() {
//     // final client = ChopperClient(
//     //     // baseUrl: apiUrl,
//     //     // interceptors: [_addQuery, HttpLoggingInterceptor()],
//     //     // converter: ModelConverter(),
//     //     // errorConverter: const JsonConverter(),
//     //     // services: [
//     //     //   _$TemplateService(),
//     //     // ],
//     //     );
//     var ms = MockService();
//     ms.init();
//     return ms;
//   }

//   @override
//   Future<Iterable<CustomerModel>> loadService() async {
//     if (_projectsList.isEmpty) {
//       var jsonString = await rootBundle.loadString('mock_data/entities.json');
//       _projectsList = (jsonDecode(jsonString)['customers'] as List)
//           .map((element) =>
//               CustomerModel.fromJson(element as Map<String, dynamic>))
//           .toList();
//     }
//     return _projectsList;
//   }

//   late Iterable<CustomerModel> _projectsList = <CustomerModel>[];

//   void init() {
//     loadServiceData();
//   }

//   void loadServiceData() async {}
// }

