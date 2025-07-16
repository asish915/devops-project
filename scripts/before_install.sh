#!/bin/bash
echo "Stopping nginx if running..."
systemctl stop nginx || true
