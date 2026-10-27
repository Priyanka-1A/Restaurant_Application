@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view restaurent table'
@Metadata.allowExtensions: true
define root view entity zrt_c_table as projection on zrt_i_table
{
    key TableId,
    TableName,
    Status,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _order: redirected to composition child zrt_c_order
}
