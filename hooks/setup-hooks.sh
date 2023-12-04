#!/bin/bash

# Path to the custom hooks directory in the repository
HOOKS_DIR=.

# Path to the Git hooks directory
GIT_HOOKS_DIR=../.git/hooks

# Define a list of allowed hook filenames
ALLOWED_HOOKS=("pre-commit" "post-commit" "pre-push" "pre-receive" "post-receive")

# Iterate over the list of allowed hooks
for hook in "${ALLOWED_HOOKS[@]}"; do
    hook_path="$HOOKS_DIR/$hook"
    # Check if the hook file exists in the hooks directory
    if [[ -f "$hook_path" ]]; then
        # Create a symlink (useful for easy updates)
        ln -sf "../../$HOOKS_DIR/$hook" "$GIT_HOOKS_DIR/$hook"

        echo "Set up hook: $hook"
    else
        echo "Allowed hook not found: $hook"
    fi
done

echo "Hooks setup complete."