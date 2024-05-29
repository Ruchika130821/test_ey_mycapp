using { anubhav.db.master,anubhav.db.transaction } from '../db/datamodel';

service Catalogservice @(path:'Catalogservice') {

    entity EmployeeSet as projection on master.employees;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity POs @(odata.draft.enabled: true)  as projection on transaction.purchaseorder 
    {
        *,
        case OVERALL_STATUS
            when 'N' then 'NEW'
            when 'P' then 'PAID'
            when 'A' then 'APPROVED'
            when 'X' then 'REJECTED'
            end as OverallStatus: String(10)
        
    }
     actions
     {  
        @Common.SideEffects : {
            $Type : 'Common.SideEffectsType',
            TargetProperties : [
                'in/GROSS_AMOUNT'
            ]
        }
         action boost() returns POs;
     };
    entity POItems as projection on transaction.poitems;
     function getLargestOrder() returns POs;

}