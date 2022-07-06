import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:invoiceninja_flutter/redux/app/app_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/utils/formatting.dart';
import 'package:invoiceninja_flutter/utils/strings.dart';

part 'service_report.g.dart';

abstract class ServiceReportListResponse
    implements
        Built<ServiceReportListResponse, ServiceReportListResponseBuilder> {
  factory ServiceReportListResponse(
          [void updates(ServiceReportListResponseBuilder b)]) =
      _$ServiceReportListResponse;

  ServiceReportListResponse._();

  @override
  @memoized
  int get hashCode;

  BuiltList<ServiceReportEntity> get data;

  static Serializer<ServiceReportListResponse> get serializer =>
      _$serviceReportListResponseSerializer;
}

abstract class ServiceReportItemResponse
    implements
        Built<ServiceReportItemResponse, ServiceReportItemResponseBuilder> {
  factory ServiceReportItemResponse(
          [void updates(ServiceReportItemResponseBuilder b)]) =
      _$ServiceReportItemResponse;

  ServiceReportItemResponse._();

  @override
  @memoized
  int get hashCode;

  ServiceReportEntity get data;

  static Serializer<ServiceReportItemResponse> get serializer =>
      _$serviceReportItemResponseSerializer;
}

class ServiceReportFields {
  // STARTER: fields - do not remove comment
  static const String client_id = 'client_id';
  static const String reportNo = 'report_no';
  static const String type = 'type';
  static const String updatedAt = 'updated_at';
}

abstract class ServiceReportEntity extends Object
    with BaseEntity
    implements Built<ServiceReportEntity, ServiceReportEntityBuilder> {
  // STARTER: properties - do not remove comment

  factory ServiceReportEntity({String id, AppState state}) {
    return _$ServiceReportEntity._(
        id: id ?? BaseEntity.nextId,
        isChanged: false,
        isDeleted: false,
        createdAt: 0,
        updatedAt: 0,
        createdUserId: '',
        assignedUserId: '',
        archivedAt: 0,

        // STARTER: constructor - do not remove comment
        type: '',
        clientId: '',
        reportNo: '');
  }

  ServiceReportEntity._();

  @override
  @memoized
  int get hashCode;

  @override
  EntityType get entityType => EntityType.serviceReport;

  String get type;

  @nullable
  @BuiltValueField(wireName: 'client_id')
  String get clientId;

  @BuiltValueField(wireName: 'report_no')
  String get reportNo;

  String get displayName {
    // STARTER: display name - do not remove comment
    return type + ' ' + reportNo;
  }

  int compareTo(
      ServiceReportEntity report, String sortField, bool sortAscending) {
    const int response = 0;
    final reportA = sortAscending ? this : report;
    final reportB = sortAscending ? report : this;

    // switch (sortField) {
    //   // STARTER: sort switch - do not remove comment
    //   default:
    //     print('## ERROR: sort by category.$sortField is not implemented');
    //     break;
    // }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return reportA.reportNo.compareTo(reportB.reportNo);
    } else {
      return response;
    }
  }

  @override
  bool matchesFilter(String filter) {
    return matchesStrings(
      haystacks: [type, reportNo, displayName],
      needle: filter,
    );
  }

  @override
  String matchesFilterValue(String filter) {
    return matchesStringsValue(
      haystacks: [type, reportNo, displayName],
      needle: filter,
    );
  }

  @override
  String get listDisplayName => type + ' ' + reportNo;

  @override
  double get listDisplayAmount => null;

  @override
  FormatNumberType get listDisplayAmountType => null;

  static Serializer<ServiceReportEntity> get serializer =>
      _$serviceReportEntitySerializer;
}
