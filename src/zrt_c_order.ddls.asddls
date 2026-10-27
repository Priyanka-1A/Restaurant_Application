@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view restaurent order header'
@Metadata.allowExtensions: true
define view entity zrt_c_order as projection 
on zrt_i_order
{
    key OrderId,
    TableId,
    OrderStatus,
    @Semantics.amount.currencyCode: 'Currency'
    TotalAmount,
    Currency,
    LocalLastChangedAt,
    /* Associations */
    _orderitems:redirected to composition child zrt_c_order_item,
    _table:redirected to parent zrt_c_table
}
