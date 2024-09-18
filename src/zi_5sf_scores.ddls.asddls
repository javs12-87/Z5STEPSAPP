@AbapCatalog.sqlViewName: 'ZI5SFSCORES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '5SF Scores'
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
define view ZI_5SF_SCORES
  as select from zsurvey_t

{
  group_id               as GroupId,
  q1                     as Q1,
  q2                     as Q2,
  q3                     as Q3,
  q4_1                   as Q41,
  q4_2                   as Q42,
  q4_3                   as Q43,
  q4_4                   as Q44,
  q5                     as Q5,
  q6                     as Q6,
  q7                     as Q7,
  q8                     as Q8,
  q9_g                   as Q9G,
  q9_nps                 as Q9Nps,
  q10                    as Q10,
  
  //    Response Analysis per Region
  //
  //
  @EndUserText.label: 'Total Responses'
  @Aggregation.default: #SUM
  1                      as TotalResponses,

  @EndUserText.label: 'Participating Regions'
  @Aggregation.default: #COUNT_DISTINCT
  @Aggregation.referenceElement: ['Q1']
  cast( 1 as abap.int4 ) as ResponseType,

  @EndUserText.label: 'Participants per Region: NA'
  @Aggregation.default: #SUM
  case q1
      when 1 then 1
      else 0
  end                    as RegionNA,

  @EndUserText.label: 'Participants per Region: LA'
  @Aggregation.default: #SUM
  case q1
      when 2 then 1
      else 0
  end                    as RegionLA,

  @EndUserText.label: 'Participants per Region: EMEA'
  @Aggregation.default: #SUM
  case q1
      when 3 then 1
      else 0
  end                    as RegionEMEA,

  @EndUserText.label: 'Participants per Region: APJ'
  @Aggregation.default: #SUM
  case q1
      when 4 then 1
      else 0
  end                    as RegionAPJ,

  @EndUserText.label: 'Participants per Region: Other'
  @Aggregation.default: #SUM
  case q1
      when 5 then 1
      else 0
  end                    as RegionOther,

  //    Response Analysis per RoleType
  //
  //
  @EndUserText.label: 'Participants per Role: Basis'
  @Aggregation.default: #SUM
  case q2
      when 1 then 1
      else 0
  end                    as RoleBasis,

  @EndUserText.label: 'Participants per Role: Functional'
  @Aggregation.default: #SUM
  case q2
      when 2 then 1
      else 0
  end                    as RoleFunctional,

  @EndUserText.label: 'Participants per Role: Developer'
  @Aggregation.default: #SUM
  case q2
      when 3 then 1
      else 0
  end                    as RoleDeveloper,

  @EndUserText.label: 'Participants per Role: Security'
  @Aggregation.default: #SUM
  case q2
      when 4 then 1
      else 0
  end                    as RoleSecurity,

  @EndUserText.label: 'Participants per Role: Other'
  @Aggregation.default: #SUM
  case q2
      when 5 then 1
      else 0
  end                    as RoleOther,

  //    Response Analysis for Satisfaction
  //
  //
  @EndUserText.label: 'Satisfaction: Extremely dissatisfied'
  @Aggregation.default: #SUM
  case q3
      when 0 then 1
      else 0
  end                    as SatisfactionED,

  @EndUserText.label: 'Satisfaction: Somewhat dissatisfied'
  @Aggregation.default: #SUM
  case q3
      when 1 then 1
      else 0
  end                    as SatisfactionSD,

  @EndUserText.label: 'Satisfaction: Neither satisfied'
  @Aggregation.default: #SUM
  case q3
      when 2 then 1
      else 0
  end                    as SatisfactionNSND,

  @EndUserText.label: 'Satisfaction: Somewhat satisfied'
  @Aggregation.default: #SUM
  case q3
      when 3 then 1
      else 0
  end                    as SatisfactionSS,

  @EndUserText.label: 'Satisfaction: Extremely satisfied'
  @Aggregation.default: #SUM
  case q3
      when 4 then 1
      else 0
  end                    as SatisfactionES,

  //    Response Analysis for Content
  //
  //
  @EndUserText.label: 'Content: Extremely dissatisfied'
  @Aggregation.default: #SUM
  case q4_1
      when 1 then 1
      else 0
  end                    as ContentED,

  @EndUserText.label: 'Content: Somewhat dissatisfied'
  @Aggregation.default: #SUM
  case q4_1
      when 2 then 1
      else 0
  end                    as ContentSD,

  @EndUserText.label: 'Content: Neither satisfied'
  @Aggregation.default: #SUM
  case q4_1
      when 3 then 1
      else 0
  end                    as ContentNSND,

  @EndUserText.label: 'Content: Somewhat satisfied'
  @Aggregation.default: #SUM
  case q4_1
      when 4 then 1
      else 0
  end                    as ContentSS,

  @EndUserText.label: 'Content: Extremely satisfied'
  @Aggregation.default: #SUM
  case q4_1
      when 5 then 1
      else 0
  end                    as ContentES,

  //    Response Analysis for Duration
  //
  //
  @EndUserText.label: 'Duration: Extremely dissatisfied'
  @Aggregation.default: #SUM
  case q4_2
      when 1 then 1
      else 0
  end                    as DurationED,

  @EndUserText.label: 'Duration: Somewhat dissatisfied'
  @Aggregation.default: #SUM
  case q4_2
      when 2 then 1
      else 0
  end                    as DurationSD,

  @EndUserText.label: 'Duration: Neither satisfied'
  @Aggregation.default: #SUM
  case q4_2
      when 3 then 1
      else 0
  end                    as DurationNSND,

  @EndUserText.label: 'Duration: Somewhat satisfied'
  @Aggregation.default: #SUM
  case q4_2
      when 4 then 1
      else 0
  end                    as DurationSS,

  @EndUserText.label: 'Duration: Extremely satisfied'
  @Aggregation.default: #SUM
  case q4_2
      when 5 then 1
      else 0
  end                    as DurationES,

  //    Response Analysis for Style
  //
  //
  @EndUserText.label: 'Style: Extremely dissatisfied'
  @Aggregation.default: #SUM
  case q4_3
      when 1 then 1
      else 0
  end                    as StyleED,

  @EndUserText.label: 'Style: Somewhat dissatisfied'
  @Aggregation.default: #SUM
  case q4_3
      when 2 then 1
      else 0
  end                    as StyleSD,

  @EndUserText.label: 'Style: Neither satisfied'
  @Aggregation.default: #SUM
  case q4_3
      when 3 then 1
      else 0
  end                    as StyleNSND,

  @EndUserText.label: 'Style: Somewhat satisfied'
  @Aggregation.default: #SUM
  case q4_3
      when 4 then 1
      else 0
  end                    as StyleSS,

  @EndUserText.label: 'Style: Extremely satisfied'
  @Aggregation.default: #SUM
  case q4_3
      when 5 then 1
      else 0
  end                    as StyleES,

  //    Response Analysis for Delivery
  //
  //
  @EndUserText.label: 'Delivery: Extremely dissatisfied'
  @Aggregation.default: #SUM
  case q4_4
      when 1 then 1
      else 0
  end                    as DeliveryED,

  @EndUserText.label: 'Delivery: Somewhat dissatisfied'
  @Aggregation.default: #SUM
  case q4_4
      when 2 then 1
      else 0
  end                    as DeliverySD,

  @EndUserText.label: 'Delivery: Neither satisfied'
  @Aggregation.default: #SUM
  case q4_4
      when 3 then 1
      else 0
  end                    as DeliveryNSND,

  @EndUserText.label: 'Delivery: Somewhat satisfied'
  @Aggregation.default: #SUM
  case q4_4
      when 4 then 1
      else 0
  end                    as DeliverySS,

  @EndUserText.label: 'Delivery: Extremely satisfied'
  @Aggregation.default: #SUM
  case q4_4
      when 5 then 1
      else 0
  end                    as DeliveryES,

  //    Response Analysis for Likes
  //
  //
  @EndUserText.label: 'Likes: Slide Deck'
  @Aggregation.default: #SUM
  case q5
      when 1 then 1
      else 0
  end                    as LikesSD,

  @EndUserText.label: 'Likes: Video Recordings'
  @Aggregation.default: #SUM
  case q5
      when 2 then 1
      else 0
  end                    as LikesVR,

  @EndUserText.label: 'Likes: Hands-on Exercises'
  @Aggregation.default: #SUM
  case q5
      when 3 then 1
      else 0
  end                    as LikesHE,

  @EndUserText.label: 'Likes: 1:1'
  @Aggregation.default: #SUM
  case q5
      when 4 then 1
      else 0
  end                    as LikesOTO,

  @EndUserText.label: 'Likes: JAM Collaboration'
  @Aggregation.default: #SUM
  case q5
      when 5 then 1
      else 0
  end                    as LikesJAM,

  @EndUserText.label: 'Likes: Time for Instruction'
  @Aggregation.default: #SUM
  case q5
      when 6 then 1
      else 0
  end                    as LikesTFI,

  @EndUserText.label: 'Likes: Time for Exercise'
  @Aggregation.default: #SUM
  case q5
      when 7 then 1
      else 0
  end                    as LikesTFE,

  @EndUserText.label: 'Likes: Deployment Option'
  @Aggregation.default: #SUM
  case q5
      when 8 then 1
      else 0
  end                    as LikesDO,

  @EndUserText.label: 'Likes: Presentation'
  @Aggregation.default: #SUM
  case q5
      when 9 then 1
      else 0
  end                    as LikesP,

  @EndUserText.label: 'Likes: Other'
  @Aggregation.default: #SUM
  case q5
      when 10 then 1
      else 0
  end                    as LikesOther,

  //    Response Analysis for Time
  //
  //
  @EndUserText.label: 'Time: None'
  @Aggregation.default: #SUM
  case q6
      when 1 then 1
      else 0
  end                    as TimeNone,

  @EndUserText.label: 'Time: Less 2 hours per day'
  @Aggregation.default: #SUM
  case q6
      when 2 then 1
      else 0
  end                    as TimeLT2,

  @EndUserText.label: 'Time: 2-4 hours per day'
  @Aggregation.default: #SUM
  case q6
      when 3 then 1
      else 0
  end                    as Time2T4,

  @EndUserText.label: 'Time: 4-6 hours per day'
  @Aggregation.default: #SUM
  case q6
      when 4 then 1
      else 0
  end                    as Time4T6,

  @EndUserText.label: 'Time: 7+ hours per day'
  @Aggregation.default: #SUM
  case q6
      when 5 then 1
      else 0
  end                    as TimeMT7,

  @EndUserText.label: 'Time: Other'
  @Aggregation.default: #SUM
  case q6
      when 6 then 1
      else 0
  end                    as TimeOther,

  //    Response Analysis for Completion
  //
  //
  @EndUserText.label: 'Completion: 0-25%'
  @Aggregation.default: #SUM
  case q7
      when 1 then 1
      else 0
  end                    as CompletionLow,

  @EndUserText.label: 'Completion: 26-50%'
  @Aggregation.default: #SUM
  case q7
      when 2 then 1
      else 0
  end                    as CompletionMid,

  @EndUserText.label: 'Completion: 51-75%'
  @Aggregation.default: #SUM
  case q7
      when 3 then 1
      else 0
  end                    as CompletionReg,

  @EndUserText.label: 'Completion: 76-100%'
  @Aggregation.default: #SUM
  case q7
      when 4 then 1
      else 0
  end                    as CompletionHigh,

  @EndUserText.label: 'Completion: Other'
  @Aggregation.default: #SUM
  case q7
      when 6 then 1
      else 0
  end                    as CompletionOther,

  //    Response Analysis for Understanding
  //
  //
  @EndUserText.label: 'Understanding: Yes'
  @Aggregation.default: #SUM
  case q8
      when 1 then 1
      else 0
  end                    as UnderstandingY,

  @EndUserText.label: 'Understanding: No'
  @Aggregation.default: #SUM
  case q8
      when 2 then 1
      else 0
  end                    as UnderstandingN,

  //    Response Analysis per NPS Grouping
  //
  //
  @EndUserText.label: 'Promoter Count'
  @Aggregation.default: #SUM
  case q9_g
      when 3 then 1
      else 0
  end                    as PromoterCount,

  @EndUserText.label: 'Passive Count'
  @Aggregation.default: #SUM
  case q9_g
      when 2 then 1
      else 0
  end                    as PassiveCount,

  @EndUserText.label: 'Detractor Count'
  @Aggregation.default: #SUM
  case q9_g
      when 1 then 1
      else 0
  end                    as DetractorCount,

  //    Response Analysis For NPS
  //
  //
  
  @EndUserText.label: 'NPS 10'
  @Aggregation.default: #SUM
  case q9_nps
      when 10 then 1
      else 0
  end                    as NPS10,

  @EndUserText.label: 'NPS 9'
  @Aggregation.default: #SUM
  case q9_nps
      when 9 then 1
      else 0
  end                    as NPS9,

  @EndUserText.label: 'NPS 8'
  @Aggregation.default: #SUM
  case q9_nps
      when 8 then 1
      else 0
  end                    as NPS8,

  @EndUserText.label: 'NPS 7'
  @Aggregation.default: #SUM
  case q9_nps
      when 7 then 1
      else 0
  end                    as NPS7,

  @EndUserText.label: 'NPS 6'
  @Aggregation.default: #SUM
  case q9_nps
      when 6 then 1
      else 0
  end                    as NPS6,

  @EndUserText.label: 'NPS 5'
  @Aggregation.default: #SUM
  case q9_nps
      when 5 then 1
      else 0
  end                    as NPS5,

  @EndUserText.label: 'NPS 4'
  @Aggregation.default: #SUM
  case q9_nps
      when 4 then 1
      else 0
  end                    as NPS4,

  @EndUserText.label: 'NPS 3'
  @Aggregation.default: #SUM
  case q9_nps
      when 3 then 1
      else 0
  end                    as NPS3,

  @EndUserText.label: 'NPS 2'
  @Aggregation.default: #SUM
  case q9_nps
      when 2 then 1
      else 0
  end                    as NPS2,

  @EndUserText.label: 'NPS 1'
  @Aggregation.default: #SUM
  case q9_nps
      when 1 then 1
      else 0
  end                    as NPS1,

  @EndUserText.label: 'NPS 0'
  @Aggregation.default: #SUM
  case q9_nps
      when 0 then 1
      else 0
  end                    as NPS0,
  
  //    Response Analysis for Confidence
  //
  //
  @EndUserText.label: 'Confidence: Extremely unconfident'
  @Aggregation.default: #SUM
  case q10
      when 1 then 1
      else 0
  end                    as ConfidenceEU,

  @EndUserText.label: 'Confidence: Somewhat unconfident'
  @Aggregation.default: #SUM
  case q10
      when 2 then 1
      else 0
  end                    as ConfidenceSU,

  @EndUserText.label: 'Confidence: Neither confident'
  @Aggregation.default: #SUM
  case q10
      when 3 then 1
      else 0
  end                    as ConfidenceNCNU,

  @EndUserText.label: 'Confidence: Somewhat confident'
  @Aggregation.default: #SUM
  case q10
      when 4 then 1
      else 0
  end                    as ConfidenceSC,

  @EndUserText.label: 'Confidence: Extremely confident'
  @Aggregation.default: #SUM
  case q10
      when 5 then 1
      else 0
  end                    as ConfidenceEC

}
