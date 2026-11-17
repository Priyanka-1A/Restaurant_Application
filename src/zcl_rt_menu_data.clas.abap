CLASS zcl_rt_menu_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RT_MENU_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA lt_table TYPE TABLE OF zrt_menu.

    APPEND VALUE zrt_menu( Item_Id   = 'M001'
           Item_Name = 'Chicken Biryani'
           Category = 'Main Course'
           Price    = '250.00'
           Currency = 'INR'
           Available = abap_true
         ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M002'
            Item_Name = 'Veg Biryani'
            Category = 'Main Course'
            Price    = '180.00'
            Currency = 'INR'
            Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
  Item_Id   = 'M003'
  Item_Name = 'Paneer Tikka'
  Category  = 'Starter'
  Price     = '150.00'
  Currency  = 'INR'
  Available = abap_true
) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M004'
      Item_Name = 'Masala Dosa'
      Category  = 'Breakfast'
      Price     = '90.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M005'
      Item_Name = 'Gobi Manchurian'
      Category  = 'Starter'
      Price     = '130.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M006'
      Item_Name = 'Paneer Butter Masala'
      Category  = 'Main Course'
      Price     = '200.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M007'
      Item_Name = 'French Fries'
      Category  = 'Starter'
      Price     = '100.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M008'
      Item_Name = 'Gulab Jamun'
      Category  = 'Dessert'
      Price     = '60.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M009'
      Item_Name = 'Chocolate Brownie'
      Category  = 'Dessert'
      Price     = '120.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M010'
      Item_Name = 'Cold Coffee'
      Category  = 'Beverage'
      Price     = '110.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M011'
      Item_Name = 'Fresh Lime Soda'
      Category  = 'Beverage'
      Price     = '50.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    APPEND VALUE zrt_menu(
      Item_Id   = 'M012'
      Item_Name = 'Butter Naan'
      Category  = 'Main Course'
      Price     = '40.00'
      Currency  = 'INR'
      Available = abap_true
    ) TO lt_table.

    INSERT zrt_MENU FROM TABLE @lt_table.

    out->write( |Records inserted: { sy-dbcnt }| ).
  ENDMETHOD.
ENDCLASS.
