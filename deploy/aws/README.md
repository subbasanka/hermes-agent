# Deploy on AWS EC2

Launch a GPU-powered EC2 instance with the agent pre-configured using AWS CloudFormation.

## One-Click Deploy via CloudFormation

1. Open the [AWS CloudFormation Console](https://console.aws.amazon.com/cloudformation).
2. Click **Create Stack** → **With new resources**.
3. Upload the `cloudformation.yaml` file from this folder (or paste the S3 URL if hosted).
4. Fill in the parameters:
   - **InstanceType**: `g4dn.xlarge` (default, T4 16GB GPU)
   - **KeyPairName**: Your existing EC2 key pair for SSH access
5. Click **Create Stack** and wait ~5 minutes for provisioning.
6. Find the instance's public IP in the **Outputs** tab.
7. SSH in:

```bash
ssh -i your-key.pem ubuntu@<instance-ip>
```

8. Run `hermes setup` to configure your Telegram bot token.
9. Start the agent:

```bash
nohup hermes start > $HOME/hermes_agent.log 2>&1 &
```

## Recommended Instance Types

| Instance | GPU | VRAM | Cost (on-demand) |
| --- | --- | --- | --- |
| `g4dn.xlarge` | T4 | 16GB | ~$0.53/hr |
| `g5.xlarge` | A10G | 24GB | ~$1.01/hr |
| `g5.2xlarge` | A10G | 24GB | ~$1.21/hr |

**Cost tip:** Use Spot Instances for up to 70% savings if you're okay with potential interruptions.

## Security Group

The CloudFormation template creates a security group that allows:
- **SSH (port 22)** from your IP for terminal access
- **Outbound all** for Telegram API polling

No inbound ports are needed for the Telegram bot — it uses outbound long-polling.

## Stopping Costs

- **Stop the instance** when not using the bot (you only pay for EBS storage ~$0.10/GB/month).
- **Terminate the stack** via CloudFormation to delete all resources cleanly.
