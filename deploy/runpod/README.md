# Deploy on RunPod

The fastest way to get started. This pre-configured template launches an NVIDIA GPU pod with all dependencies ready.

## One-Click Deploy

[![Deploy on RunPod](https://img.shields.io/badge/Deploy-RunPod-blueviolet?style=for-the-badge&logo=cloud)](https://console.runpod.io/deploy?template=pqm60pu2rg&ref=043t6w9h)

## What the Template Includes

- Ubuntu with NVIDIA GPU drivers
- Ollama pre-installed
- Gemma 2 model ready to pull
- All system dependencies

## Steps After Deploying

1. Click the deploy button above and select your GPU (RTX A4000 recommended).
2. Wait for the pod to initialize (~1-2 minutes).
3. Click **Connect** → **Web Terminal** in the RunPod dashboard.
4. Run the setup script:

```bash
curl -fsSL https://raw.githubusercontent.com/subbasanka/hermes-agent/main/setup.sh | bash
```

5. Follow the `hermes setup` wizard prompts (see [Configuration Guide](../../README.md#interactive-configuration-guide)).
6. Your bot is now live on Telegram!

## Recommended GPU Tiers

| GPU | VRAM | Cost | Performance |
| --- | --- | --- | --- |
| RTX A4000 | 16GB | ~$0.36/hr | Great for Gemma 2 9B |
| RTX A5000 | 24GB | ~$0.49/hr | Faster inference |
| RTX 4090 | 24GB | ~$0.69/hr | Fastest consumer-tier |

## Keeping It Running

RunPod pods stay active as long as you're paying. Use `nohup` to keep the bot alive after closing the terminal — see [Keeping the Bot Alive 24/7](../../README.md#keeping-the-bot-alive-247).
