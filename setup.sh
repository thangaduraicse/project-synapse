#!/bin/bash

if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3 and try again."
    exit 1
fi

if ! command -v pip &> /dev/null; then
    echo "pip is not installed. Please install pip and try again."
    exit 1
fi

if [ ! -d "llm-venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv llm-venv
else
    echo "Virtual environment already exists. Skipping creation."
fi

source llm-venv/bin/activate

if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install --upgrade pip
    pip install -r requirements.txt
else
    echo "No requirements.txt found. You can manually install dependencies later."
fi

echo "Project setup complete!"
echo "To activate the virtual environment, use:"
echo "source llm-venv/bin/activate"
