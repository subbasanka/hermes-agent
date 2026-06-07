# Autonomous Telegram AI Agent (Gemma 2 + Hermes Framework)

Deploy a private, lightning-fast autonomous AI agent running locally on an NVIDIA GPU using **Ollama (Gemma 2)** and orchestrated by the **Hermes Agent** framework. This setup connects directly to a custom mobile Telegram Bot interface.

## Features

* **100% Local Inference:** No per-message API fees using Ollama.
* **Autonomous Memory:** The agent builds persistent memory profiles and improves over time.
* **Mobile Accessibility:** Chat with your dedicated GPU cluster directly from your phone via Telegram.
* **RunPod & Cloud Ready:** Optimized to spin up instantly on on-demand cloud GPUs (like the NVIDIA RTX A4000).

---

## Quick Deploy on RunPod

Deploy the entire pre-configured environment with one click using the RunPod template:

[![Deploy on RunPod](https://img.shields.io/badge/Deploy-RunPod-blueviolet?style=for-the-badge&logo=cloud)](https://console.runpod.io/deploy?template=pqm60pu2rg&ref=043t6w9h)

This template comes with Ollama and all dependencies pre-installed on an NVIDIA GPU. After deploying, just connect to the terminal and run `hermes setup` to configure your Telegram bot.

---

## One-Click Server Setup (Other Platforms)

For any clean Ubuntu Linux instance (EC2, Lightsail, or other cloud providers), connect to your terminal and run:

```bash
curl -fsSL https://raw.githubusercontent.com/subbasanka/hermes-agent/main/setup.sh | bash
```

---

## Interactive Configuration Guide

When the `hermes setup` wizard launches, fill out the parameters as follows:

| Prompt Field | Configuration Value | Description |
| --- | --- | --- |
| **LLM Provider** | `Custom Endpoint` | Routes requests locally instead of a paid cloud API |
| **API URL** | `http://localhost:11434/v1` | Points directly to your internal Ollama engine |
| **API Key** | `ollama` | Placeholder security string required by the framework |
| **Model Name** | `gemma2` | The Google Gemma 2 9B parameter model brain |
| **Chat Application** | `Telegram` | Sets your communication delivery service |
| **Bot Token** | `YOUR_BOT_TOKEN` | Secret key retrieved from Telegram's `@BotFather` |

---

## Manual Installation Steps

If you prefer to install the components line-by-line:

### 1. Update System Packages

```bash
apt-get update && apt-get install -y curl git xz-utils
```

### 2. Download the Model Brain

```bash
ollama run gemma2
```

Type `/exit` to return to the command line once the download completes.

### 3. Install Hermes Agent & Configure

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
source ~/.bashrc
hermes setup
```

---

## Managing Your Agent

| Command | Description |
| --- | --- |
| `hermes start` | Start the agent |
| `hermes setup` | Reconfigure settings |
| `ollama run [model_name]` | Switch to a different model |

---

## Architecture

```
Telegram (Mobile) --> RunPod GPU Instance --> Hermes Agent Framework --> Ollama (Gemma 2 9B)
```

The agent runs entirely on your own infrastructure with no data leaving your server.

## License

This project is open-source and available under the [MIT License](LICENSE).
