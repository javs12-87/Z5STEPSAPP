@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forSession'
@ObjectModel.semanticKey: [ 'SessionID' ]
@Search.searchable: true
define view entity ZC_5SFSESSION
  as projection on ZI_5SFSession
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key SessionID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key SessionYear,
  SessionRegion,
  SessionQuarter,
  SessionSurveygroup,
  SessionName,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt,
  _Session_S : redirected to parent ZC_5SFSession_S,
  SingletonID
  
}
