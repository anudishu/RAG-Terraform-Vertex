# 🖱️ Deploy RAG-Terraform-Vertex Using Google Cloud Console (No Terraform/CLI)

This guide walks you through deploying a Retrieval-Augmented Generation (RAG) application using only the Google Cloud Console (web UI). No command line or Terraform is required. Follow these steps to complete the hands-on lab:

---

## 1️⃣ Create or Select a Google Cloud Project

1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. In the top navigation bar, click the project dropdown and select an existing project or click **New Project** to create one.
3. Ensure billing is enabled for your project. ([Enable billing](https://cloud.google.com/billing/docs/how-to/modify-project))

---

## 2️⃣ Enable Required APIs

1. In the left menu, go to **APIs & Services > Library**.
2. Search for and enable each of the following APIs:
    - **Vertex AI API** (`aiplatform.googleapis.com`)
    - **Discovery Engine API** (`discoveryengine.googleapis.com`)
    - **Cloud Storage API** (`storage.googleapis.com`)
    - **Compute Engine API** (`compute.googleapis.com`)

---

## 3️⃣ Set Up Vertex AI Search (Discovery Engine)

1. In the left menu, go to **Vertex AI**.
2. Under **Search and Conversation**, select **Data stores**.
3. Click **Create**.
4. Fill in the required details:
    - **Name**: Enter a name for your data store.
    - **Region**: Choose a region (e.g., `us-central1`).
    - **Data store type**: Select the appropriate type (e.g., **Document**).
5. Click **Create** and wait for the data store to be provisioned.
6. Note your **Data Store ID** for later use.

---

## 4️⃣ Create a Search Engine

1. In **Vertex AI**, go to **Search and Conversation > Search engines**.
2. Click **Create**.
3. Link the search engine to your newly created data store.
4. Complete the creation steps and note your **Engine ID**.

---

## 5️⃣ Upload Documents to Cloud Storage

1. In the left menu, go to **Cloud Storage > Buckets**.
2. Click **Create** to make a new bucket, or select an existing one.
3. Upload your document files (PDF, TXT, etc.) to the bucket.
    - For demo purposes, you can use Google’s public sample data:  
      `gs://cloud-samples-data/gen-app-builder/search/alphabet-investor-pdfs`

---

## 6️⃣ Import Data into Vertex AI Data Store

1. Return to **Vertex AI > Search and Conversation > Data stores**.
2. Click on your data store.
3. Go to the **Documents** tab and click **Import**.
4. Select **Cloud Storage** as the source.
5. Enter the bucket or folder path (e.g., the sample data above).
6. Follow the prompts to complete the import.
7. Wait for the data to be indexed (this may take a few minutes).

---

## 7️⃣ Test Your RAG Application

1. In your data store or search engine view, find the **Try it out** or **Query** section.
2. Enter a sample query (e.g., “Who is the CEO of Google?”).
3. Verify that the responses are based on your uploaded documents.

---

## 8️⃣ Clean Up Resources

To avoid ongoing charges:
- Delete the data store and search engine in **Vertex AI**.
- Delete any Cloud Storage buckets you created for this lab.
- Optionally, delete the entire GCP project if no longer needed.

---

**Note:** All steps above use only the Google Cloud Console UI. For advanced automation, see the Terraform-based instructions above.
