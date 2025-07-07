# Create Test DataStore
resource "google_discovery_engine_data_store" "test-ds" {
  location                    = "global"
  data_store_id               = "demo_store_id"
  display_name                = "test-unstructured-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "CONTENT_REQUIRED"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
  project                     = "modelarmor-463317"
}

# Create Test Serach Engine
resource "google_discovery_engine_search_engine" "test-engine" {
  engine_id         = "demo_engine_app"
  collection_id     = "default_collection"
  location          = google_discovery_engine_data_store.test-ds.location
  display_name      = "test-engine"
  industry_vertical = "GENERIC"
  data_store_ids    = [google_discovery_engine_data_store.test-ds.data_store_id]
  common_config {
    company_name = "Test Company"
  }
  search_engine_config {
    search_add_ons = ["SEARCH_ADD_ON_LLM"]
  }
  project = "modelarmor-463317"
}

