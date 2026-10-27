CLASS zcl_rt_table_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_rt_table_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

 DATA lt_table TYPE TABLE OF zrt_table.

  APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T001'
    table_name = 'Table 1'
    status     = 'A'
  ) TO lt_table.

  APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T002'
    table_name = 'Table 2'
    status     = 'A'
  ) TO lt_table.

  APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T003'
    table_name = 'Table 3'
    status     = 'A'
  ) TO lt_table.

  APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T004'
    table_name = 'Table 4'
    status     = 'A'
  ) TO lt_table.

  APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T005'
    table_name = 'Table 5'
    status     = 'A'
  ) TO lt_table.

    APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T006'
    table_name = 'Table 6'
    status     = 'A'
  ) TO lt_table.

  APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T007'
    table_name = 'Table 7'
    status     = 'A'
  ) TO lt_table.

    APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T008'
    table_name = 'Table 8'
    status     = 'A'
  ) TO lt_table.

    APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T009'
    table_name = 'Table 9'
    status     = 'A'
  ) TO lt_table.

    APPEND VALUE zrt_table(
    mandt      = sy-mandt
    table_id   = 'T010'
    table_name = 'Table 10'
    status     = 'A'
  ) TO lt_table.
  INSERT zrt_table FROM TABLE @lt_table.

  out->write( |Records inserted: { sy-dbcnt }| ).
  ENDMETHOD.
ENDCLASS.
