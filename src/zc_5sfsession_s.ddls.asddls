@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forSession_S'
@ObjectModel.semanticKey: [ 'SingletonID' ]
@Search.searchable: true
define root view entity ZC_5SFSESSION_S
  as projection on ZI_5SFSession_S
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  key SingletonID,
  _Session : redirected to composition child ZC_5SFSession,
  LastChangedAtMax,
  Request,
  HideTransport
  
}
