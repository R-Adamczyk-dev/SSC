// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInvoiceIsarCollection on Isar {
  IsarCollection<InvoiceIsar> get invoiceIsars => this.collection();
}

const InvoiceIsarSchema = CollectionSchema(
  name: r'InvoiceIsar',
  id: 1979887869611365456,
  properties: {
    r'attachmentName': PropertySchema(
      id: 0,
      name: r'attachmentName',
      type: IsarType.string,
    ),
    r'attachmentPath': PropertySchema(
      id: 1,
      name: r'attachmentPath',
      type: IsarType.string,
    ),
    r'contractor': PropertySchema(
      id: 2,
      name: r'contractor',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'grossAmount': PropertySchema(
      id: 4,
      name: r'grossAmount',
      type: IsarType.double,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.string,
    ),
    r'invoiceNumber': PropertySchema(
      id: 6,
      name: r'invoiceNumber',
      type: IsarType.string,
    ),
    r'netAmount': PropertySchema(
      id: 7,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'vatRate': PropertySchema(
      id: 8,
      name: r'vatRate',
      type: IsarType.byte,
      enumMap: _InvoiceIsarvatRateEnumValueMap,
    )
  },
  estimateSize: _invoiceIsarEstimateSize,
  serialize: _invoiceIsarSerialize,
  deserialize: _invoiceIsarDeserialize,
  deserializeProp: _invoiceIsarDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _invoiceIsarGetId,
  getLinks: _invoiceIsarGetLinks,
  attach: _invoiceIsarAttach,
  version: '3.1.0+1',
);

int _invoiceIsarEstimateSize(
  InvoiceIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attachmentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attachmentPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.contractor.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.invoiceNumber.length * 3;
  return bytesCount;
}

void _invoiceIsarSerialize(
  InvoiceIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attachmentName);
  writer.writeString(offsets[1], object.attachmentPath);
  writer.writeString(offsets[2], object.contractor);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.grossAmount);
  writer.writeString(offsets[5], object.id);
  writer.writeString(offsets[6], object.invoiceNumber);
  writer.writeDouble(offsets[7], object.netAmount);
  writer.writeByte(offsets[8], object.vatRate.index);
}

InvoiceIsar _invoiceIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InvoiceIsar();
  object.attachmentName = reader.readStringOrNull(offsets[0]);
  object.attachmentPath = reader.readStringOrNull(offsets[1]);
  object.contractor = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.grossAmount = reader.readDouble(offsets[4]);
  object.id = reader.readString(offsets[5]);
  object.invoiceNumber = reader.readString(offsets[6]);
  object.isarId = id;
  object.netAmount = reader.readDouble(offsets[7]);
  object.vatRate =
      _InvoiceIsarvatRateValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          VatRate.zero;
  return object;
}

P _invoiceIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (_InvoiceIsarvatRateValueEnumMap[reader.readByteOrNull(offset)] ??
          VatRate.zero) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _InvoiceIsarvatRateEnumValueMap = {
  'zero': 0,
  'seven': 1,
  'twentyThree': 2,
};
const _InvoiceIsarvatRateValueEnumMap = {
  0: VatRate.zero,
  1: VatRate.seven,
  2: VatRate.twentyThree,
};

Id _invoiceIsarGetId(InvoiceIsar object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _invoiceIsarGetLinks(InvoiceIsar object) {
  return [];
}

void _invoiceIsarAttach(
    IsarCollection<dynamic> col, Id id, InvoiceIsar object) {
  object.isarId = id;
}

extension InvoiceIsarQueryWhereSort
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QWhere> {
  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InvoiceIsarQueryWhere
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QWhereClause> {
  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> idEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterWhereClause> idNotEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension InvoiceIsarQueryFilter
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QFilterCondition> {
  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentName',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentName',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      attachmentPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractor',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      contractorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractor',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      grossAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grossAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      grossAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grossAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      grossAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grossAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      grossAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grossAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      invoiceNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      netAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      netAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      netAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      netAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> vatRateEqualTo(
      VatRate value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatRate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition>
      vatRateGreaterThan(
    VatRate value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vatRate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> vatRateLessThan(
    VatRate value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vatRate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterFilterCondition> vatRateBetween(
    VatRate lower,
    VatRate upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vatRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InvoiceIsarQueryObject
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QFilterCondition> {}

extension InvoiceIsarQueryLinks
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QFilterCondition> {}

extension InvoiceIsarQuerySortBy
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QSortBy> {
  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByAttachmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentName', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy>
      sortByAttachmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentName', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByAttachmentPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy>
      sortByAttachmentPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByContractor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractor', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByContractorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractor', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy>
      sortByInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByVatRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> sortByVatRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.desc);
    });
  }
}

extension InvoiceIsarQuerySortThenBy
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QSortThenBy> {
  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByAttachmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentName', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy>
      thenByAttachmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentName', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByAttachmentPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy>
      thenByAttachmentPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByContractor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractor', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByContractorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractor', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy>
      thenByInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByVatRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QAfterSortBy> thenByVatRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatRate', Sort.desc);
    });
  }
}

extension InvoiceIsarQueryWhereDistinct
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> {
  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByAttachmentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByAttachmentPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByContractor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossAmount');
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByInvoiceNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<InvoiceIsar, InvoiceIsar, QDistinct> distinctByVatRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatRate');
    });
  }
}

extension InvoiceIsarQueryProperty
    on QueryBuilder<InvoiceIsar, InvoiceIsar, QQueryProperty> {
  QueryBuilder<InvoiceIsar, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<InvoiceIsar, String?, QQueryOperations>
      attachmentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentName');
    });
  }

  QueryBuilder<InvoiceIsar, String?, QQueryOperations>
      attachmentPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath');
    });
  }

  QueryBuilder<InvoiceIsar, String, QQueryOperations> contractorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractor');
    });
  }

  QueryBuilder<InvoiceIsar, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<InvoiceIsar, double, QQueryOperations> grossAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossAmount');
    });
  }

  QueryBuilder<InvoiceIsar, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InvoiceIsar, String, QQueryOperations> invoiceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceNumber');
    });
  }

  QueryBuilder<InvoiceIsar, double, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<InvoiceIsar, VatRate, QQueryOperations> vatRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatRate');
    });
  }
}
