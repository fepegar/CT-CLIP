default:
    @just --list

@install_uv:
	if ! command -v uv >/dev/null 2>&1; then \
		echo "uv is not installed. Installing..."; \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
	fi

setup: install_uv
    uv sync

login: setup
    uv run huggingface-cli login

download: setup
    uv run -- huggingface-cli download \
        --repo-type dataset \
        ibrahimhamamci/CT-RATE \
        models/CT-CLIP-Related/CT-CLIP_v2.pt
