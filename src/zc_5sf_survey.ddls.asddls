@EndUserText.label: '5 Steps to Fiori Survey'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'ResponseId' ]
define root view entity ZC_5SF_Survey
  as projection on ZI_5SF_SURVEY
{
  key ResponseUUID,
      ResponseId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      GroupId,
      Q1,
      Q1Txt,
      Q2,
      Q3,
      Q41,
      Q42,
      Q43,
      Q44,
      Q4Txt,
      Q5,
      Q5Txt,
      Q6,
      Q6Txt,
      Q7,
      Q7Txt,
      Q8,
      Q8Txt,
      Q9G,
      Q9Nps,
      Q10,
      Q11Txt,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt
}
