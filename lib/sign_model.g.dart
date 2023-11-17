// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetails.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDetailsCollection on Isar {
  IsarCollection<Details> get details => this.collection();
}

const DetailsSchema = CollectionSchema(
  name: r'Details',
  id: -6145017574900706740,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _detailsEstimateSize,
  serialize: _detailsSerialize,
  deserialize: _detailsDeserialize,
  deserializeProp: _detailsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _detailsGetId,
  getLinks: _detailsGetLinks,
  attach: _detailsAttach,
  version: '3.1.0+1',
);

int _detailsEstimateSize(
    Details object,
    List<int> offsets,
    Map<Type, List<int>> allOffsets,
    ) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _detailsSerialize(
    Details object,
    IsarWriter writer,
    List<int> offsets,
    Map<Type, List<int>> allOffsets,
    ) {
  writer.writeString(offsets[0], object.name);
}

Details _detailsDeserialize(
    Id id,
    IsarReader reader,
    List<int> offsets,
    Map<Type, List<int>> allOffsets,
    ) {
  final object = Details();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _detailsDeserializeProp<P>(
    IsarReader reader,
    int propertyId,
    int offset,
    Map<Type, List<int>> allOffsets,
    ) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _detailsGetId(Details object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _detailsGetLinks(Details object) {
  return [];
}

void _detailsAttach(IsarCollection<dynamic> col, Id id, Details object) {
  object.id = id;
}

extension DetailsQueryWhereSort on QueryBuilder<Details, Details, QWhere> {
  QueryBuilder<Details, Details, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DetailsQueryWhere on QueryBuilder<Details, Details, QWhereClause> {
  QueryBuilder<Details, Details, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
          IdWhereClause.lessThan(upper: id, includeUpper: false),
        )
            .addWhereClause(
          IdWhereClause.greaterThan(lower: id, includeLower: false),
        );
      } else {
        return query
            .addWhereClause(
          IdWhereClause.greaterThan(lower: id, includeLower: false),
        )
            .addWhereClause(
          IdWhereClause.lessThan(upper: id, includeUpper: false),
        );
      }
    });
  }

  QueryBuilder<Details, Details, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Details, Details, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Details, Details, QAfterWhereClause> idBetween(
      Id lowerId,
      Id upperId, {
        bool includeLower = true,
        bool includeUpper = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DetailsQueryFilter
on QueryBuilder<Details, Details, QFilterCondition> {
  QueryBuilder<Details, Details, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> idGreaterThan(
      Id value, {
        bool include = false,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> idLessThan(
      Id value, {
        bool include = false,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> idBetween(
      Id lower,
      Id upper, {
        bool includeLower = true,
        bool includeUpper = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameEqualTo(
      String value, {
        bool caseSensitive = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameGreaterThan(
      String value, {
        bool include = false,
        bool caseSensitive = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameLessThan(
      String value, {
        bool include = false,
        bool caseSensitive = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameBetween(
      String lower,
      String upper, {
        bool includeLower = true,
        bool includeUpper = true,
        bool caseSensitive = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameStartsWith(
      String value, {
        bool caseSensitive = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameEndsWith(
      String value, {
        bool caseSensitive = true,
      }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Details, Details, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DetailsQueryObject
on QueryBuilder<Details, Details, QFilterCondition> {}

extension DetailsQueryLinks
on QueryBuilder<Details, Details, QFilterCondition> {}

extension DetailsQuerySortBy on QueryBuilder<Details, Details, QSortBy> {
  QueryBuilder<Details, Details, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Details, Details, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DetailsQuerySortThenBy
on QueryBuilder<Details, Details, QSortThenBy> {
  QueryBuilder<Details, Details, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Details, Details, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Details, Details, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Details, Details, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DetailsQueryWhereDistinct
on QueryBuilder<Details, Details, QDistinct> {
  QueryBuilder<Details, Details, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension DetailsQueryProperty
on QueryBuilder<Details, Details, QQueryProperty> {
  QueryBuilder<Details, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Details, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
