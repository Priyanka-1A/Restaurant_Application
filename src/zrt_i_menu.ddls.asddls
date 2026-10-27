@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Restaurant Menu'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zrt_i_menu
  as select from zrt_menu
  //  association [0..*] to zrt_i_order_item as _orderitems on $projection.ItemId = _orderitems.ItemId
  association [0..*] to zrt_i_order_item as _orderitems on $projection.ItemId = _orderitems.ItemId
{
  key item_id               as ItemId,
      item_name             as ItemName,
      category              as Category,
      @Semantics.amount.currencyCode: 'currency'
      price                 as Price,
      currency              as Currency,
      available             as Available,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // Associations
      _orderitems

}
