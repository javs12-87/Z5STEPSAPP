@AbapCatalog.sqlViewName: 'ZC5SFCOMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '5SF Comments'

@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'GroupId' ]

define view ZC_5SF_Comments
  as select from ZI_5SF_SURVEY
  
  association to ZVH_5SF_SESSION as _session on $projection.GroupId =_session.SessionSurveygroup
  
{
  key ResponseUUID,
      GroupId,
      _session.SessionName,
      Q4Txt,
      Q5Txt,
      Q6Txt,
      Q7Txt,
      Q8Txt,
      Q11Txt,
      
      _session
      
}
