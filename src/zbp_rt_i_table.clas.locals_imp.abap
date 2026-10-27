CLASS lhc__orderitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    METHODS CalculateAmount FOR DETERMINE ON MODIFY
       keys FOR _orderitem~CalculateAmount.

ENDCLASS.

CLASS lhc__orderitem IMPLEMENTATION.

  METHOD CalculateAmount.
*  READ ENTITIES OF zrt_i_order_item IN LOCAL MODE


    READ ENTITIES OF zrt_i_table IN LOCAL MODE
         ENTITY _orderitem BY \_order
         FIELDS ( TableId OrderId )
         WITH CORRESPONDING #( keys )
         RESULT DATA(lt_order).

    READ ENTITIES OF zrt_i_table IN LOCAL MODE
        ENTITY _order BY \_orderitems
        FIELDS ( OrderId UnitPrice Quantity )
        WITH CORRESPONDING #( lt_order )
*        LINK DATA(OrderItems_links)
        RESULT DATA(lt_Orderitem).

    IF lt_orderitem IS INITIAL.
      RETURN.
    ENDIF.

    MODIFY ENTITIES OF zrt_i_table IN LOCAL MODE
          ENTITY _orderitem " BY \_order
          UPDATE FIELDS ( Amount )
          WITH VALUE #(
                         FOR ls_orderitem IN lt_orderitem
                         (
                             %tky = ls_orderitem-%tky
                             Amount = ls_orderitem-UnitPrice *
                                      ls_orderitem-Quantity
                          ) ).

    MODIFY ENTITIES OF zrt_i_table IN LOCAL MODE
              ENTITY _order " BY \_order
              UPDATE FIELDS ( TotalAmount )
              WITH VALUE #(
                             FOR ls_order IN lt_order
                             (
                                 %tky = ls_order-%tky
                                 TotalAmount = REDUCE #(
                                 INIT total = CONV zrt_i_order-TotalAmount( 0 )
                                 FOR ls_orderitem IN lt_orderitem
                                 WHERE ( OrderId = ls_order-OrderId )
                                 NEXT total = total + ( ls_orderitem-UnitPrice *
                                 ls_orderitem-Quantity  )
                                  )
                              ) ).


  ENDMETHOD.

ENDCLASS.

CLASS lhc__tables DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR _tables RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR _tables RESULT result.

ENDCLASS.

CLASS lhc__tables IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

