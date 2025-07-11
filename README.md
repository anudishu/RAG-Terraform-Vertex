# 🔍🤖 **RAG-Terraform-Vertex**

---

> **Deploy a modern Retrieval-Augmented Generation (RAG) stack on Google Cloud using Terraform, Vertex AI, Discovery Engine, and GCS.**

---

## 🚦 Deployment Options

You can deploy this RAG solution on Google Cloud in two ways:

- **Option 1:** [Terraform/CLI (Recommended for automation)](#option-1-terraformcli-way)
- **Option 2:** [Google Cloud Console (No CLI, UI only)](#option-2-google-cloud-console-way)

---

# Option 1: Terraform/CLI Way

## 📚 What is RAG?

**Retrieval-Augmented Generation (RAG)** is an AI technique that enhances Large Language Models (LLMs) by combining information retrieval with generative capabilities. Instead of relying solely on model parameters, RAG retrieves relevant external documents from a knowledge base or data store, resulting in more accurate, contextual, and up-to-date responses.

---

## 🚦 Prerequisites

- 🏢 **Google Cloud project** with billing enabled
- 👤 **IAM Role:** Project Owner or Editor
- 🧑‍💻 **Basic knowledge:** Google Cloud, Terraform, Generative AI, LLMs, Embeddings

---

## ⚙️ Deployment Steps

### 1️⃣ Open Google Cloud Shell or Local Terminal

> You can run the following commands in Google Cloud Shell or your local terminal (with `gcloud` CLI configured).

---
### 2️⃣ Clone the Repository

```bash
git clone https://github.com/anudishu/RAG-Terraform-Vertex.git
cd RAG-Terraform-Vertex
```


---

### 3️⃣ Enable Required Google Cloud APIs

```bash
gcloud services enable \
    compute.googleapis.com \
    aiplatform.googleapis.com \
    storage.googleapis.com \
    discoveryengine.googleapis.com
```

**Verify APIs:**
- Go to Google Cloud Console → Search for "AI Application"
- Navigate to the **AI Applications** page
- Click **Continue and activate the API** if prompted
- Confirm all required APIs are listed and active

---

### 4️⃣ Set Environment Variables

Replace placeholders with your actual values:

```bash
export PROJECT_ID="your-gcp-project-id" # get your project id from google cloud console
export REGION="us-central1"   # e.g. us-central1
gcloud config set project $PROJECT_ID
```

---

### 5️⃣ Authenticate with Google Cloud

Authenticate your environment to allow Terraform and Python scripts to access Google Cloud services:

```bash
gcloud auth application-default login
```

> **Follow the authentication flow:**
> 1. Copy the provided link from the terminal
> 2. Open it in your browser and login with your GCP account
> 3. Copy the authorization code and paste it back in the terminal

---

### 6️⃣ Initialize and Apply Terraform Configuration

> **Before you deploy infrastructure:**
> 
> Open the `terraform.tfvars` file and update the `project_id` variable with your actual Google Cloud project ID.
>
> ```
> project_id = "your-gcp-project-id"
> ```
>
> Save the file after making the change.

This will provision all required infrastructure on Google Cloud:
- Discovery Engine Data Store
- Discovery Engine Search Engine

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

> **After successful deployment, note the Terraform outputs:**
> ```
> test_data_store_id = "demo_store_id"
> test_engine_id = "demo_engine_app"
> ```

---

## 📥 Load Data into RAG Data Store

### 🔧 1. Update `loaddata.py`

Open `loaddata.py` and set the correct project ID at the end of the file:

```python
PROJECT_ID = "your-gcp-project-id"
```


### ▶️ 2. Run the Data Loader

```bash
python loaddata.py
```

This script will upload public documents (`gs://cloud-samples-data/gen-app-builder/search/alphabet-investor-pdfs`) into your configured Vertex AI Search data store.

---

## 🧪 Test the RAG Application

Once your data is indexed:

- Send test queries using the deployed app interface (if applicable)
- Or trigger inference via Vertex AI API
- Ensure that answers reflect content from the uploaded documents

#### 🖥️ Run a Query from Terminal

Open `query.py`, set the correct project ID at the end of the file, then run:

```bash
python query.py
```

#### 💡 Sample Test Queries

```python
QUERY = "who is ceo of google? what is total revenue of google?"

# More examples:
QUERY = "What were Google Cloud earnings in 2024?"
QUERY = "Google Cloud financial results and revenue growth"
QUERY = "What is Google's market capitalization and stock performance?"
QUERY = "Google advertising revenue breakdown by quarter"
QUERY = "Alphabet Inc financial highlights and key metrics"
QUERY = "Google Cloud vs AWS market share comparison"
QUERY = "What are Google's main business segments and revenue sources?"
QUERY = "Google's investment in AI and machine learning initiatives"
QUERY = "YouTube revenue and user engagement statistics"
QUERY = "Google's data center locations and infrastructure investments"
```

---

## 🧹 Clean Up Resources

To avoid incurring charges, destroy the provisioned infrastructure when no longer needed:

```bash
terraform destroy -auto-approve
```

---

## 📌 Additional Notes

- Ensure your IAM permissions allow you to create and manage required resources.
- For troubleshooting, check the [Google Cloud documentation](https://cloud.google.com/docs) or open an issue in this repo.

---

> **Happy Building! 🚀**

---

# Option 2: Google Cloud Console Way

> **No CLI or Terraform required! Use the Google Cloud Console UI for a fully guided, point-and-click deployment.**

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

1. In the Google Cloud Console, search for **AI Application**.
2. Under **Datastores**, select **Create Data stores**.
3. Select **Data Source** as **Cloud Storage**.
4. Leave all settings as default. For the GCS URL, enter:
   - `cloud-samples-data/gen-app-builder/search/alphabet-investor-pdfs`
5. Fill in the required details:
   - **Datastore Name**: Enter a name for your data store.
6. Click **Create** and wait for the data store to be provisioned.
7. **Note your Data Store ID** for later use.

---

## 4️⃣ Create a Search Engine

1. In **AI Application**, go to the right-side menu and click **App > Create App**.
2. Select **Custom Search**.
3. Enter an **App Name**.
4. Enter a **Company Name** (you can use any value).
5. Click **Continue**.
6. Attach the previously created datastore.
7. Done!

---




## Test Your RAG Application



---

## Clean Up Resources



---

**Note:** All steps above use only the Google Cloud Console UI. For advanced automation, see the Terraform-based instructions above.
