@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Restaurant table'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zrt_i_table
  as select from zrt_table

  composition [0..*] of zrt_i_order as _order
  //      on $projection.TableId = _order.TableId
{
//  key tableuuid             as TableUuid,
  key table_id              as TableId,
      table_name            as TableName,
      status                as Status,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      // Associations
      _order
}
