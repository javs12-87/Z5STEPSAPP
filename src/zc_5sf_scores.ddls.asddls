@AbapCatalog.sqlViewName: 'ZI5SFSCORE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '5SF Scores'
@Analytics.query: true

define view ZC_5SF_Scores
  as select from ZI_5SF_SCORES
  
 
{
    @AnalyticsDetails.query.axis: #ROWS
    GroupId,
   
//  ResponseType,
//  RegionNA,
//  RegionLA,
//  RegionEMEA,
//  RegionAPJ,
//  RegionOther,
//  
//  RoleBasis,
//  RoleFunctional,
//  RoleDeveloper,
//  RoleSecurity,
//  RoleOther,
//  
//  SatisfactionED,
//  SatisfactionSD,
//  SatisfactionNSND,
//  SatisfactionSS,
//  SatisfactionES,
//  
//  ContentED,
//  ContentSD,
//  ContentNSND,
//  ContentSS,
//  ContentES,
//  
//  DurationED,
//  DurationSD,
//  DurationNSND,
//  DurationSS,
//  DurationES,
//  
//  StyleED,
//  StyleSD,
//  StyleNSND,
//  StyleSS,
//  StyleES,
//  
//  DeliveryED,
//  DeliverySD,
//  DeliveryNSND,
//  DeliverySS,
//  DeliveryES,
//  
//  LikesSD,
//  LikesVR,
//  LikesHE,
//  LikesOTO,
//  LikesJAM,
//  LikesTFI,
//  LikesTFE,
//  LikesDO,
//  LikesP,
//  LikesOther,
//
//  TimeNone,
//  TimeLT2,
//  Time2T4,
//  Time4T6,
//  TimeMT7,
//  TimeOther,
//  
//  CompletionLow,
//  CompletionMid,
//  CompletionReg,
//  CompletionHigh,
//  CompletionOther,
//  
//  UnderstandingY,
//  UnderstandingN,
//
//  PromoterCount,
//  PassiveCount,
//  DetractorCount,
//
//  NPS10,
//  NPS9,
//  NPS8,
//  NPS7,
//  NPS6,
//  NPS5,
//  NPS4,
//  NPS3,
//  NPS2,
//  NPS1,
//  NPS0,
//  
//  ConfidenceEU,
//  ConfidenceSU,
//  ConfidenceNCNU,
//  ConfidenceSC,
//  ConfidenceEC,

  TotalResponses,
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '((ContentED*1 + ContentSD*2 + ContentNSND*3 + ContentSS*4 + ContentES*5) / TotalResponses) * 2'
  @AnalyticsDetails.query.decimals: 4
  @EndUserText.label: 'Content Score (Scale 10)'
  1 as ContentScore,

  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '((DurationED*1 + DurationSD*2 + DurationNSND*3 + DurationSS*4 + DurationES*5) / TotalResponses) * 2'
  @AnalyticsDetails.query.decimals: 4
  @EndUserText.label: 'Duration Score (Scale 10)'
  1 as DurationScore,
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '((StyleED*1 + StyleSD*2 + StyleNSND*3 + StyleSS*4 + StyleES*5) / TotalResponses) * 2'
  @AnalyticsDetails.query.decimals: 4
  @EndUserText.label: 'Presentation Style Score (Scale 10)'
  1 as StyleScore,
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '((DeliveryED*1 + DeliverySD*2 + DeliveryNSND*3 + DeliverySS*4 + DeliveryES*5) / TotalResponses) * 2'
  @AnalyticsDetails.query.decimals: 4
  @EndUserText.label: 'Delivery Mode Score (Scale 10)'
  1 as DeliveryScore,  
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '(((NPS10 + NPS9) / (NPS10 + NPS9 + NPS8 + NPS7 + NPS6 + NPS5 + NPS4 + NPS3 + NPS2 + NPS1 + NPS0)) - ((NPS6 + NPS5 + NPS4 + NPS3 + NPS2 + NPS1 + NPS0)/ (NPS10 + NPS9 + NPS8 + NPS7 + NPS6 + NPS5 + NPS4 + NPS3 + NPS2 + NPS1 + NPS0))) * 100'
  @AnalyticsDetails.query.decimals: 0
  @EndUserText.label: 'NPS'
  1 as NPS,   
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '(ConfidenceEU*1 + ConfidenceSU*2 + ConfidenceNCNU*3 + ConfidenceSC*4 + ConfidenceEC*5) / (ConfidenceEU + ConfidenceSU + ConfidenceNCNU + ConfidenceSC + ConfidenceEC)'
  @AnalyticsDetails.query.decimals: 2
  @EndUserText.label: 'Confidence (5 Star Rating)'
  1 as Confidence,
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '(UnderstandingY / TotalResponses) * 100'
  @AnalyticsDetails.query.decimals: 2
  @EndUserText.label: 'Was it useful?'
  1 as Usefullness,    
  
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.formula: '(NPS10*10 + NPS9*9 + NPS8*8 + NPS7*7 + NPS6*6 + NPS5*5 + NPS4*4 + NPS3*3 + NPS2*2 + NPS1*1 + NPS0*0) / TotalResponses'
  @AnalyticsDetails.query.decimals: 2
  @EndUserText.label: 'Would you recommend?'
  1 as Recommend,
  
  NPS10,
  NPS9,
  NPS8,
  NPS7,
  NPS6,
  NPS5,
  NPS4,
  NPS3,
  NPS2,
  NPS1,
  NPS0,
  
  ConfidenceEU,
  ConfidenceSU,
  ConfidenceNCNU,
  ConfidenceSC,
  ConfidenceEC    

}
