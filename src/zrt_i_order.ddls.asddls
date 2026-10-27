@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Restaurant Order'
@Metadata.ignorePropagatedAnnotations: true
define view entity zrt_i_order
  as select from zrt_order
  association to parent zrt_i_table      as _table on $projection.TableId = _table.TableId
  composition [0..*] of zrt_i_order_item as _orderitems
{
  key order_id              as OrderId,
      table_id              as TableId,
      order_status          as OrderStatus,
      @Semantics.amount.currencyCode: 'currency'
      total_amount          as TotalAmount,
      currency              as Currency,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // Associations
      _table,
      _orderitems
}
