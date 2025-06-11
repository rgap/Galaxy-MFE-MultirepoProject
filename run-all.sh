#!/bin/bash

# Get the absolute path of the workspace automatically
WORKSPACE_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Function to create new terminal tab and run command
open_terminal_with_app() {
    local app_dir=$1
    local port=$2
    
    osascript <<EOF
        tell application "Terminal"
            activate
            tell application "System Events"
                tell process "Terminal"
                    keystroke "t" using command down
                end tell
            end tell
            delay 0.5
            do script "cd \"${WORKSPACE_PATH}/${app_dir}\" && echo \"Starting ${app_dir} on port ${port}...\" && pnpm start" in selected tab of window 1
        end tell
EOF
}

# Clear terminal
clear

echo "🚀 Detecting and starting all micro-frontends..."
echo "📂 Working directory: $WORKSPACE_PATH"
echo

# Find all directories matching the pattern and store in array (POSIX compatible)
APPS=$(find . -maxdepth 1 -type d -name "mfe-*" -exec basename {} \; | sort)

# Convert string to array
IFS=$'\n' read -d '' -r -a APPS_ARRAY <<< "$APPS"

# Initialize arrays for filtered and sorted apps
FILTERED_APPS=()

# Filter out common components and resources
for app in "${APPS_ARRAY[@]}"; do
    case "$app" in
        *"mfe-common-resources"* | *"mfe-common-components"* | *"mfe-playground"*)
            continue
            ;;
        *)
            FILTERED_APPS+=("$app")
            ;;
    esac
done

# Sort apps so Host is first
FINAL_APPS=()
for app in "${FILTERED_APPS[@]}"; do
    if [[ $app == *"Host"* ]]; then
        FINAL_APPS=("$app" "${FINAL_APPS[@]}")
    else
        FINAL_APPS+=("$app")
    fi
done

# Function to get port for an app
get_port() {
    local app=$1
    case $app in
        *"Host"*) echo "3000" ;;
        *"Catalog"*) echo "3001" ;;
        *"Cart"*) echo "3002" ;;
        *"Checkout"*) echo "3003" ;;
        *) echo "3000" ;; # default port
    esac
}

echo "Found applications:"
for app in "${FINAL_APPS[@]}"; do
    port=$(get_port "$app")
    echo "- $app (Port: $port)"
done
echo

# Start each application in a new terminal tab
for app in "${FINAL_APPS[@]}"; do
    if [ -d "$app" ]; then
        port=$(get_port "$app")
        echo "Starting $app on port $port..."
        open_terminal_with_app "$app" "$port"
        # Small delay to prevent issues
        sleep 1
    else
        echo "⚠️  Directory $app not found!"
    fi
done

echo
echo "✨ All applications are starting in separate terminal tabs"
echo
echo "📝 Applications and their ports:"
for app in "${FINAL_APPS[@]}"; do
    port=$(get_port "$app")
    echo "- $app: http://localhost:$port"
done
echo