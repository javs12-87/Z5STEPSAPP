CLASS zfill_table_demo DEFINITION
  PUBLIC
  INHERITING FROM cl_xco_cp_adt_simple_classrun
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: main REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZFILL_TABLE_DEMO IMPLEMENTATION.


  METHOD main.
* INSERT  zsurvey_t FROM TABLE @( VALUE #(
*       (
*       response_id = '123456'
*       group_id = '6'
*       q1 = '5'
*       q1_txt = 'Hello!'
*       q2 = '5'
*       q3 = '6'
*       q4_1 = '5'
*       q4_2 = '2'
*       q4_3 = '1'
*       q4_4 = '6'
*       q4_txt = 'Hello!'
*       q5 = '8'
*       q5_txt = 'Hello!'
*       q6 = '5'
*       q6_txt = 'Hello!'
*       q7 = '2'
*       q8 = '6'
*       q8_txt = 'Hello!'
*       q9_g = '3'
*       q9_nps = '2'
*       q10 = '5'
*       q11_txt = 'Hello!'
*       )
*       ) ).
*
*    INSERT  zsurvey_t FROM TABLE @( VALUE #(
*       (
*       client = '100'
*       response_uuid = 'ee278a78-676e-11ec-90d6-0242ac120003'
*       response_id = '123456'
*       group_id = '6'
*       q1 = '5'
*       q1_txt = 'Hello!'
*       q2 = '5'
*       q3 = '6'
*       q4_1 = '5'
*       q4_2 = '2'
*       q4_3 = '1'
*       q4_4 = '6'
*       q4_txt = 'Hello!'
*       q5 = '8'
*       q5_txt = 'Hello!'
*       q6 = '5'
*       q6_txt = 'Hello!'
*       q7 = '2'
*       q8 = '6'
*       q8_txt = 'Hello!'
*       q9_g = '3'
*       q9_nps = '2'
*       q10 = '5'
*       q11_txt = 'Hello!'
*       created_by = sy-uname
*       )
*       ) ).
*     SELECT * FROM zsurvey_t INTO TABLE @DATA(lt_sql_entries).
     DELETE FROM zsurvey_t.
     DELETE FROM zsurvey_t_d.
    IF sy-subrc = 0.
*       DATA(numberofrecords) = lines( lt_sql_entries ).
*       out->write( numberofrecords && ' entries inserted successfully ' ).
       out->write( ' entries deleted successfully ' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
