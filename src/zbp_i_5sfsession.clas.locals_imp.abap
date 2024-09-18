CLASS LHC_SESSION DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      VAL_TRANSPORT FOR VALIDATE ON SAVE
        IMPORTING
          KEYS FOR  Session~val_transport .
ENDCLASS.

CLASS LHC_SESSION IMPLEMENTATION.
  METHOD VAL_TRANSPORT.
  DATA change TYPE REQUEST FOR CHANGE ZI_5SFSession_S.
  SELECT SINGLE request FROM Z5SFSESSION_S00D INTO @DATA(request).
  DATA(rap_transport_api) = mbc_cp_api=>rap_table_cts( table_entity_relations = VALUE #(
                                               ( entity = 'Session' table = 'Z5SF_SESSIONS' )
                                                                         ) ).
  rap_transport_api->validate_changes(
      transport_request = request
      table             = 'Z5SF_SESSIONS'
      keys              = REF #( keys )
      reported          = REF #( reported )
      failed            = REF #( failed )
      change            = REF #( change-Session ) ).
  ENDMETHOD.
ENDCLASS.
