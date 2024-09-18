@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '5 Steps to Fiori Survey'
define root view entity ZI_5SF_SURVEY
  as select from zsurvey_t as Survey
{
  key Survey.response_uuid         as ResponseUUID,
      Survey.response_id           as ResponseId,
      Survey.group_id              as GroupId,
      Survey.q1                    as Q1,
      Survey.q1_txt                as Q1Txt,
      Survey.q2                    as Q2,
      Survey.q3                    as Q3,
      Survey.q4_1                  as Q41,
      Survey.q4_2                  as Q42,
      Survey.q4_3                  as Q43,
      Survey.q4_4                  as Q44,
      Survey.q4_txt                as Q4Txt,
      Survey.q5                    as Q5,
      Survey.q5_txt                as Q5Txt,
      Survey.q6                    as Q6,
      Survey.q6_txt                as Q6Txt,
      Survey.q7                    as Q7,
      Survey.q7_txt                as Q7Txt,
      Survey.q8                    as Q8,
      Survey.q8_txt                as Q8Txt,
      Survey.q9_g                  as Q9G,
      Survey.q9_nps                as Q9Nps,
      Survey.q10                   as Q10,
      Survey.q11_txt               as Q11Txt,
      @Semantics.user.createdBy: true
      Survey.created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      Survey.created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      Survey.last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      Survey.last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Survey.local_last_changed_at as LocalLastChangedAt

}
