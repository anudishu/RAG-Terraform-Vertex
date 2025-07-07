# 🔍🤖 RAG-Terraform-Vertex

## What is RAG?

**Retrieval-Augmented Generation (RAG)** is an AI technique that enhances Large Language Models (LLMs) by combining information retrieval with generative capabilities. Instead of relying solely on model parameters, RAG retrieves relevant external documents from a knowledge base or data store, resulting in more accurate, contextual, and up-to-date responses.

This project demonstrates how to deploy a RAG architecture on **Google Cloud Platform (GCP)** using **Terraform**, integrating **Vertex AI**, **Discovery Engine**, and **GCS**.

## 🚀 Prerequisites

* A Google Cloud project with billing enabled
* IAM role: Project Owner or Editor
* Installed:
   * gcloud CLI
   * Terraform
   * Python 3.x
* Basic knowledge of Google Cloud services and Terraform

## Required Pip Packages

```bash
pip install google-cloud-storage google-api-core google-cloud-discoveryengine
```

## ⚙️ Deployment Steps

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/anudishu/RAG-Terraform-Vertex.git
cd RAG-Terraform-Vertex
```

### 2️⃣ Open Google Cloud Shell or Your Local Terminal

You can run the following commands in Google Cloud Shell or your local terminal (with gcloud CLI configured).

### 3️⃣ Enable Required Google Cloud APIs

```bash
gcloud services enable \
    compute.googleapis.com \
    aiplatform.googleapis.com \
    storage.googleapis.com \
    discoveryengine.googleapis.com
```

### 4️⃣ Set Environment Variables

Replace placeholders with your actual values.

```bash
export PROJECT_ID="your-gcp-project-id"
export REGION="your-region"   # e.g. us-central1

gcloud config set project $PROJECT_ID
```

### 5️⃣ Authenticate with Google Cloud

Authenticate your environment to allow Terraform and Python scripts to access Google Cloud services.

```bash
gcloud auth application-default login
```

### 6️⃣ Initialize and Apply Terraform Configuration

This will provision all required infrastructure on Google Cloud:

* Vertex AI resources
* GCS bucket for storing documents
* Discovery Engine Data Store
* (Optional) App Engine or Cloud Run for frontend/backend services

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## 📥 Load Data into RAG Data Store

After infrastructure is deployed:

### 🔧 1. Update loaddata.py

Open `loaddata.py` and set the correct project and datastore IDs:

```python
PROJECT_ID = "your-gcp-project-id"
DATASTORE_ID = "your-datastore-id"
```

You can find the DATASTORE_ID in the Vertex AI Search console or from Terraform output.

### ▶️ 2. Run the Data Loader

```bash
python loaddata.py
```

This script will upload documents (PDF, HTML, etc.) into your configured Vertex AI Search data store.

## 🧪 Test the RAG Application

Once your data is indexed:

* Send test queries using the deployed app interface (if applicable)
* Or trigger inference via Vertex AI API
* Ensure that answers reflect content from the uploaded documents

## 🧹 Clean Up Resources

To avoid incurring charges, destroy the provisioned infrastructure when no longer needed:

```bash
terraform destroy -auto-approve
```

## 📌 Additional Notes

* Ensure your IAM permissions allow you to create and manage required resources.
* Update any hardcoded values in Terraform or Python scripts before running.
* Use secure storage or secret managers for API keys or credentials in production.