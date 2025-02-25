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

download_model: setup
    uv run -- huggingface-cli download \
        --repo-type dataset \
        ibrahimhamamci/CT-RATE \
        models/CT-CLIP-Related/CT-CLIP_v2.pt

download_image: setup
    uv run -- huggingface-cli download \
        --repo-type dataset \
        ibrahimhamamci/CT-RATE \
        dataset/valid/valid_1/valid_1_a/valid_1_a_1.nii.gz
