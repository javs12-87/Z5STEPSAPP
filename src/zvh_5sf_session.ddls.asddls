@AbapCatalog.sqlViewName: 'ZVH5SFSESSION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '5SF Value Help: Sessions'

@Search.searchable: true

define view ZVH_5SF_SESSION as select from ZI_5SFSESSION {
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    key SessionSurveygroup,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    SessionName
}
