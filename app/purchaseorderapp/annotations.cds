using Catalogservice as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields:[

        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        OVERALL_STATUS

    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label: 'Boost',
            Action : 'Catalogservice.boost',
            Inline: true
        },
       
    ],
    UI.HeaderInfo:{
        TypeName : 'Purchase order',
        TypeNamePlural: 'Purchase Orders',
        Title : {Value : PO_ID},
        Description: {Value: PARTNER_GUID.COMPANY_NAME},
        ImageUrl : 'https://yt3.googleusercontent.com/zCgSuKDRBWCoEFP52F5WNm-8q6FYKiiIlgpdqjdQaZekQc-PDcyFhi-cO8bkvtvOvH6qPBSg=s900-c-k-c0x00ffffff-no-rj',
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'More Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Info',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing',
                    Target : '@UI.FieldGroup#Spiderman',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Status',
                    Target : '@UI.FieldGroup#Superman',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'Items/@UI.LineItem',
            Label : 'PO Items',
        },
    ],
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : NODE_KEY,
        },
    ],
    UI.FieldGroup #Spiderman:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
        ],
    },
    UI.FieldGroup #Superman:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS
            },
        ],
    }

);

annotate service.POItems with @(
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ],
    UI.HeaderInfo:{
        TypeName : 'Purchase order Item',
        TypeNamePlural: 'Purchase Order Items',
        Title : {Value : PO_ITEM_POS},
        Description: {Value: PRODUCT_GUID.DESCRIPTION},
        ImageUrl : 'https://yt3.googleusercontent.com/zCgSuKDRBWCoEFP52F5WNm-8q6FYKiiIlgpdqjdQaZekQc-PDcyFhi-cO8bkvtvOvH6qPBSg=s900-c-k-c0x00ffffff-no-rj',
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'More Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Info',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing',
                    Target : '@UI.FieldGroup#ItemData',
                }
            ],
        }
    ],
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
    ],
    UI.FieldGroup #ItemData:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    },
);
annotate service.POs with {
    PARTNER_GUID @(
        Common.Text :PARTNER_GUID.COMPANY_NAME,
        Valuelist.entity: service.BusinessPartnerSet
    )
    
};
annotate service.POItems with {
    PRODUCT_GUID @(
        Common.Text :PRODUCT_GUID.DESCRIPTION,
        Valuelist.entity: service.ProductSet
    )
};
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification: [{
        $Type:'UI.DataField',
        Value:COMPANY_NAME
    }]
) ;
@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification: [{
        $Type:'UI.DataField',
        Value:DESCRIPTION
    }]
) ;

