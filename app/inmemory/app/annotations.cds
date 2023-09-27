using { guitarStoreSrv } from '../srv/service.cds';

annotate guitarStoreSrv.Warehouse with @odata.draft.enabled;
annotate guitarStoreSrv.Warehouse with @cds.odata.valuelist;
annotate guitarStoreSrv.Product with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productInformation } };
annotate guitarStoreSrv.Product with {
  ID @Common.Text: { $value: productInformation, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Product with @UI.Identification: [{ Value: productInformation }];
annotate guitarStoreSrv.Product with {
  productInformation @title: 'Product Information';
  targetAudiencePitch @title: 'Target Audience Pitch';
  discount @title: 'Discount'
};

annotate guitarStoreSrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productInformation },
    { $Type: 'UI.DataField', Value: targetAudiencePitch },
    { $Type: 'UI.DataField', Value: discount }
];

annotate guitarStoreSrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productInformation },
    { $Type: 'UI.DataField', Value: targetAudiencePitch },
    { $Type: 'UI.DataField', Value: discount }
  ]
};

annotate guitarStoreSrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarStoreSrv.Warehouse with @UI.HeaderInfo: { TypeName: 'Warehouse', TypeNamePlural: 'Warehouses', Title: { Value: stock } };
annotate guitarStoreSrv.Warehouse with {
  ID @Common.Text: { $value: stock, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Warehouse with @UI.Identification: [{ Value: stock }];
annotate guitarStoreSrv.Warehouse with {
  stock @title: 'Stock'
};

annotate guitarStoreSrv.Warehouse with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: stock }
];

annotate guitarStoreSrv.Warehouse with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: stock }
  ]
};

annotate guitarStoreSrv.Warehouse with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Product', Target : 'products/@UI.LineItem' }
];

