# 🔍🤖 **RAG-Terraform-Vertex**

---

> **Deploy a modern Retrieval-Augmented Generation (RAG) stack on Google Cloud using Terraform, Vertex AI, Discovery Engine, and GCS.**

---

## 📚 What is RAG?

**Retrieval-Augmented Generation (RAG)** is an AI technique that enhances Large Language Models (LLMs) by combining information retrieval with generative capabilities. Instead of relying solely on model parameters, RAG retrieves relevant external documents from a knowledge base or data store, resulting in more accurate, contextual, and up-to-date responses.

---

## 🚦 Prerequisites

- 🏢 **Google Cloud project** with billing enabled
- 👤 **IAM Role:** Project Owner or Editor
- 🧑‍💻 **Basic knowledge:** Google Cloud, Terraform, Generative AI, LLMs, Embeddings

---

## ⚙️ Deployment Steps

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/anudishu/RAG-Terraform-Vertex.git
cd RAG-Terraform-Vertex
```

---

### 2️⃣ Open Google Cloud Shell or Local Terminal

> You can run the following commands in Google Cloud Shell or your local terminal (with `gcloud` CLI configured).

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
export PROJECT_ID="your-gcp-project-id"
export REGION="your-region"   # e.g. us-central1
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

Open `loaddata.py` and set the correct project and datastore IDs at the end of the file:

```python
PROJECT_ID = "your-gcp-project-id"
DATASTORE_ID = "your-datastore-id"
```

> You can find the `DATASTORE_ID` in the Vertex AI Search console or from Terraform output.

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

Open `query.py`, set the correct project and datastore IDs at the end of the file, then run:

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
