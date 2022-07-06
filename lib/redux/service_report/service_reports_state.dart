import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/category_model.dart';
import 'package:invoiceninja_flutter/data/models/service_report.dart';
import 'package:invoiceninja_flutter/redux/ui/entity_ui_state.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/pref_state.dart';

part 'service_reports_state.g.dart';

abstract class ServiceReportsState
    implements Built<ServiceReportsState, ServiceReportsStateBuilder> {
  factory ServiceReportsState() {
    return _$ServiceReportsState._(
      map: BuiltMap<String, ServiceReportEntity>(),
      list: BuiltList<String>(),
    );
  }
  ServiceReportsState._();

  @override
  @memoized
  int get hashCode;

  BuiltMap<String, ServiceReportEntity> get map;
  BuiltList<String> get list;

  ServiceReportEntity get(String serviceReportId) {
    if (map.containsKey(serviceReportId)) {
      return map[serviceReportId];
    } else {
      return ServiceReportEntity(id: serviceReportId);
    }
  }

  ServiceReportsState loadServiceReports(
      BuiltList<ServiceReportEntity> reports) {
    final map = Map<String, ServiceReportEntity>.fromIterable(
      reports,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    );

    return rebuild((b) => b
      ..map.addAll(map)
      ..list.replace((map.keys.toList() + list.toList()).toSet().toList()));
  }

  static Serializer<ServiceReportsState> get serializer =>
      _$serviceReportsStateSerializer;
}
