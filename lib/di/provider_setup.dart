import 'package:provider/single_child_widget.dart';

/* 전체적인 provider 관리 */
List<SingleChildWidget> globalProviders = [
  // ... 으로 다 가지고 있으면서 여기서만 의존성 관리를 하려고 함.
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

/* 독립적인 provider 관리 */
List<SingleChildWidget> independentModels = [];

/* 의존성이 있는 객체 */
List<SingleChildWidget> dependentModels = [];

/* viewmodel */
List<SingleChildWidget> viewModels = [];
