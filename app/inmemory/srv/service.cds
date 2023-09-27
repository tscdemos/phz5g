using { guitarStore } from '../db/schema.cds';

service guitarStoreSrv {
  entity Warehouse as projection on guitarStore.Warehouse;
}