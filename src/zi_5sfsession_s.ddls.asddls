@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forSession_S'
define root view entity ZI_5SFSESSION_S
  as select from I_Language
    left outer join z5sf_sessions as child_tab on 0 = 0
  composition [0..*] of ZI_5SFSession as _Session
{
  key 1 as SingletonID,
  _Session,
  max (child_tab.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as sxco_transport) as Request,
  cast( 'X' as abap_boolean) as HideTransport
  
}
where I_Language.Language = $session.system_language
