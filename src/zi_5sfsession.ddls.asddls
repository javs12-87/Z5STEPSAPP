@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forSession'
define view entity ZI_5SFSESSION
  as select from Z5SF_SESSIONS
  association to parent ZI_5SFSession_S as _Session_S on $projection.SingletonID = _Session_S.SingletonID
{
  key SESSION_ID as SessionID,
  key SESSION_YEAR as SessionYear,
  SESSION_REGION as SessionRegion,
  SESSION_QUARTER as SessionQuarter,
  SESSION_SURVEYGROUP as SessionSurveygroup,
  SESSION_NAME as SessionName,
  @Semantics.systemDateTime.createdAt: true
  CREATED_AT as CreatedAt,
  @Semantics.user.lastChangedBy: true
  LAST_CHANGED_BY as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  _Session_S,
  1 as SingletonID
  
}
