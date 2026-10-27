@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Restaurant Order item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zrt_i_order_item
  as select from zrt_order_item
  association [1..1] to zrt_i_table        as _table on $projection.TableId = _table.TableId

  association        to parent zrt_i_order as _order on $projection.OrderId = _order.OrderId
{
  key    order_id              as OrderId,
  key    tableid               as TableId,
  key    item_uuid             as ItemUuid,
         item_id               as ItemId,
         item_name             as ItemName,
         quantity              as Quantity,
         @Semantics.amount.currencyCode: 'currency'
         unit_price            as UnitPrice,
         @Semantics.amount.currencyCode: 'currency'
         amount                as Amount,
         item_status           as ItemStatus,
         currency              as Currency,
         @Semantics.systemDateTime.localInstanceLastChangedAt: true
         local_last_changed_at as LocalLastChangedAt,

         // Association
         _order,
         _table
}
