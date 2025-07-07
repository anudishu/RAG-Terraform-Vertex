# Output resource Id's
output "test_data_store_id" {
  value = resource.google_discovery_engine_data_store.test-ds.data_store_id
}
output "test_engine_id" {
  value = resource.google_discovery_engine_search_engine.test-engine.engine_id
}