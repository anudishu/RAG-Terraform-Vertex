# 🔍🤖 RAG-Terraform-Vertex

...

## ⚙️ Deployment Steps

<!-- Existing Terraform/CLI instructions remain unchanged -->

---

## 🖱️ Alternative: Deploy Using Google Cloud Console (No Terraform/CLI)

If you prefer to use the Google Cloud Console (web UI) instead of Terraform or CLI, follow these steps:

### 1️⃣ Create or Select a Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/).
2. Select an existing project or create a new one.
3. Make sure billing is enabled for your project.

### 2️⃣ Enable Required APIs

1. In the console, navigate to **APIs & Services > Library**.
2. Search for and enable the following APIs:
    - Vertex AI API (`aiplatform.googleapis.com`)
    - Discovery Engine API (`discoveryengine.googleapis.com`)
    - Cloud Storage API (`storage.googleapis.com`)
    - Compute Engine API (`compute.googleapis.com`)

### 3️⃣ Set Up Vertex AI Search (Discovery Engine)

1. In the console, go to **Vertex AI**.
2. In the left menu, select **Search and Conversation > Data stores**.
3. Click **Create**.
4. Fill in the required details (name, region, etc.) and select the appropriate data store type.
5. Complete the creation process and note your **Data Store ID**.

### 4️⃣ Create a Search Engine

1. While in **Vertex AI Search**, go to **Search Engines** tab.
2. Click **Create** and link it to your new Data Store.
3. Complete the creation steps and note your **Engine ID**.

### 5️⃣ Upload Documents to Cloud Storage

1. In the console, navigate to **Cloud Storage > Buckets**.
2. Create a new bucket (or use an existing one).
3. Upload your document files (PDF, txt, etc.) to the bucket.

    - For lab/demo, you can use Google’s public sample data:  
      `gs://cloud-samples-data/gen-app-builder/search/alphabet-investor-pdfs`

### 6️⃣ Import Data into Vertex AI Data Store

1. Return to **Vertex AI > Search and Conversation > Data stores**.
2. Click on your Data Store.
3. Navigate to **Documents** and click **Import**.
4. Select **Cloud Storage** as your source, and provide the bucket/folder path (e.g., the sample data above).
5. Follow the prompts to complete the import.
6. Wait for data to be indexed.

### 7️⃣ Test Your RAG Application

1. In your Data Store or Search Engine view, find the **Try it out** or **Query** section.
2. Enter queries (e.g., “who is CEO of Google?”), and verify the responses are based on your uploaded documents.

### 8️⃣ Clean Up Resources

To avoid charges:
- Delete the Data Store and Search Engine in **Vertex AI**.
- Delete any Cloud Storage buckets you created for this lab.
- Optionally, delete the entire GCP project if no longer needed.

---

**Note:** All steps above use only the Google Cloud Console UI. No command line or Terraform is required. For advanced automation, see the Terraform-based instructions above.

...
