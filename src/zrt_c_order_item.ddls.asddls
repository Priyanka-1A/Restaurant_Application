@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view restaurent order item'
@Metadata.allowExtensions: true
define view entity zrt_c_order_item
  as projection on zrt_i_order_item
{
  key   OrderId,
  key   TableId,
  key   ItemUuid,
        ItemId,
        ItemName,
        Quantity,
        @Semantics.amount.currencyCode: 'Currency'
        UnitPrice,
        @Semantics.amount.currencyCode: 'Currency'
        Amount,
        ItemStatus,
        Currency,
        LocalLastChangedAt,
        /* Associations */
        _order : redirected to parent zrt_c_order,
        _table : redirected to zrt_c_table
}
