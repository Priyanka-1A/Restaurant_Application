@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Payment'
@Metadata.ignorePropagatedAnnotations: true
define view entity zrt_i_payment as select from zrt_payment
{
    key payment_id as PaymentId,
    order_id as OrderId,
    payment_method as PaymentMethod,
    @Semantics.amount.currencyCode: 'currency'
    payment_amount as PaymentAmount,
    payment_status as PaymentStatus,
    currency as Currency
}
