CLASS zcl_qrcode DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      create_form IMPORTING survey TYPE string groupid TYPE string RETURNING VALUE(r_xml) TYPE string.

    TYPES :
      BEGIN OF ads_struct,
        xdp_Template TYPE string,
        xml_Data     TYPE string,
        form_Type    TYPE string,
        form_Locale  TYPE string,
        tagged_Pdf   TYPE string,
        embed_Font   TYPE string,
      END OF ads_struct."

    CONSTANTS lc_ads_render TYPE string VALUE '/v1/adsRender/pdf'.
    CONSTANTS lc_storage_name TYPE string VALUE 'templateSource=storageName'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRCODE IMPLEMENTATION.


  METHOD create_form.

    DATA: lxs_data_xml TYPE xstring,
          lxs_xdp      TYPE xstring,
          lxs_pdf      TYPE xstring,
          li_pages     TYPE int4,
          ls_trace     TYPE string,
          lv_date      TYPE d.

    DATA(lv_xml_temp) = '<form1>' && |\n|  &&
                            '   <QRCodeBarcode1>https://sapinsights.eu.qualtrics.com/jfe/form/SV_9SmY3BoNaMwEBzU?Group=' && |{ groupid }| && '</QRCodeBarcode1>' && |\n|  &&
                            '</form1>'.

    CASE survey.
      WHEN 'FIORI'.
        CLEAR lv_xml_temp.
        lv_xml_temp = '<form1>' && |\n|  &&
                            '   <QRCodeBarcode1>https://sapinsights.eu.qualtrics.com/jfe/form/SV_9SmY3BoNaMwEBzU?Group=' && |{ groupid }| && '</QRCodeBarcode1>' && |\n|  &&
                            '</form1>'.
      WHEN 'ANALYTICS'.
        CLEAR lv_xml_temp.
        lv_xml_temp = '<form1>' && |\n|  &&
                            '   <QRCodeBarcode1>https://sapinsights.eu.qualtrics.com/jfe/form/SV_123?Group=' && |{ groupid }| && '</QRCodeBarcode1>' && |\n|  &&
                            '</form1>'.
      WHEN OTHERS.
        CLEAR lv_xml_temp.
        lv_xml_temp = '<form1>' && |\n|  &&
                            '   <QRCodeBarcode1>ERROR</QRCodeBarcode1>' && |\n|  &&
                            '</form1>'.
    ENDCASE.

    DATA(lv_xml) = cl_web_http_utility=>encode_base64( lv_xml_temp ).

    DATA(ls_body) = VALUE ads_struct( xdp_Template = '5S2F_Survey_QRCode/QRCode_Create'
                                      xml_Data = lv_xml
                                      form_Type = 'print'
                                      form_Locale = 'en'
                                      tagged_Pdf = '0'
                                      embed_font = '0' ).

    DATA(lv_json) = /ui2/cl_json=>serialize( data = ls_body compress = abap_true pretty_name = /ui2/cl_json=>pretty_mode-camel_case ).

    TRY.
        "create http destination by url; API endpoint for API sandbox
        DATA(lo_http_destination) = cl_http_destination_provider=>create_by_cloud_destination(
                                      i_name                  = 'ADS_SRV'
                                      i_authn_mode            = if_a4c_cp_service=>service_specific
                                    ).
        "create HTTP client by destination
        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .

        "adding headers
        DATA(lo_web_http_request) = lo_web_http_client->get_http_request( ).
        lo_web_http_request->set_header_fields( VALUE #(
                                                        (  name = 'DataServiceVersion' value = '2.0' )
                                                        (  name = 'Accept' value = 'application/json' )
                                                        (  name = 'Content-Type' value = 'application/json' )
                                                        ) ).
        lo_web_http_request->set_query( query =  lc_storage_name ).
        lo_web_http_request->set_uri_path( i_uri_path = lc_ads_render ).

        lo_web_http_request->append_text(
          EXPORTING
            data   = lv_json
        ).

        "set request method and execute request
        DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>post ).
        DATA(lv_response) = lo_web_http_response->get_text( ).

        FIELD-SYMBOLS:
          <data>                TYPE data,
          <field>               TYPE any,
          <pdf_based64_encoded> TYPE any.

        "lv_json_response has the following structure `{"fileName":"PDFOut.pdf","fileContent":"JVB..."}

        DATA(lr_data) = /ui2/cl_json=>generate( json = lv_response ).

        IF lr_data IS BOUND.
          ASSIGN lr_data->* TO <data>.
          ASSIGN COMPONENT `fileContent` OF STRUCTURE <data> TO <field>.
          IF sy-subrc EQ 0.
            ASSIGN <field>->* TO <pdf_based64_encoded>.
            r_xml = <pdf_based64_encoded>.
          ENDIF.
        ENDIF.

      CATCH cx_root INTO DATA(lx_exception).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
