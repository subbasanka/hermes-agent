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

## How to Run and Connect

Once your Pod is running and you have completed `hermes setup`, the agent is configured but not yet listening. Start it with:

```bash
hermes start
```

You will see logs confirming the Telegram token authenticated and the agent is listening.

### Connect via Your Phone

1. Open Telegram on your mobile device.
2. Search for the bot username you created with `@BotFather` (e.g., `@my_gemma2_agent_bot`).
3. Tap on your bot and press **Start**.
4. Type `Hello!` to test it.
5. Check the RunPod terminal — you'll see the request logged, Gemma 2 processing on the GPU, and the reply sent back to your phone.

---

## Keeping the Bot Alive 24/7

**The Problem:** If you close the RunPod browser tab, the terminal kills the process and your bot goes offline.

**The Solution:** Run the agent in the background using `nohup`:

```bash
nohup hermes start > $HOME/hermes_agent.log 2>&1 &
```

This keeps the bot running even after you close your browser. Your bot stays online as long as the RunPod instance is active.

### View logs anytime:

```bash
tail -f $HOME/hermes_agent.log
```

---

## Managing Your Agent

| Command | Description |
| --- | --- |
| `hermes start` | Start the agent (foreground) |
| `nohup hermes start > ~/hermes_agent.log 2>&1 &` | Start in background (persistent) |
| `hermes setup` | Reconfigure settings |
| `ollama run [model_name]` | Switch to a different model |
| `tail -f ~/hermes_agent.log` | View live agent logs |

---

## Architecture

```
Telegram (Mobile) --> RunPod GPU Instance --> Hermes Agent Framework --> Ollama (Gemma 2 9B)
```

The agent runs entirely on your own infrastructure with no data leaving your server.

## License

This project is open-source and available under the [MIT License](LICENSE).
