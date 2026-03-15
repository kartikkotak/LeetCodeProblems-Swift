#!/usr/bin/env python3

from pathlib import Path
import os
import sys
from urllib.parse import quote

README_MARKER_START = "<!-- SOLUTIONS_TABLE_START -->"
README_MARKER_END = "<!-- SOLUTIONS_TABLE_END -->"


def get_repo_url() -> str:
    """
    Try to detect the GitHub repository URL from environment variables.
    Fallback to empty string if not found.
    """
    github_repository = os.getenv("GITHUB_REPOSITORY")  # owner/repo
    if github_repository:
        return f"https://github.com/{github_repository}"

    return ""


def find_swift_files(solutions_dir: Path):
    """
    Recursively find all .swift files under Solutions directory.
    Returns a sorted list of relative paths.
    """
    files = [
        path.relative_to(Path.cwd())
        for path in solutions_dir.rglob("*.swift")
        if path.is_file()
    ]
    return sorted(files, key=lambda p: str(p).lower())


def build_markdown_table(files, repo_url: str, branch: str = "main") -> str:
    """
    Build markdown table with file name and GitHub link.
    """
    lines = []
    lines.append("| File | Link |")
    lines.append("|------|------|")

    for file_path in files:
        file_name = file_path.name
        encoded_path = quote(str(file_path).replace("\\", "/"))
        if repo_url:
            url = f"{repo_url}/blob/{branch}/{encoded_path}"
            link = f"[View]({url})"
        else:
            link = str(file_path).replace("\\", "/")

        lines.append(f"| `{file_name}` | {link} |")

    if not files:
        lines.append("| _No .swift files found_ | - |")

    return "\n".join(lines)


def update_readme(readme_path: Path, table_markdown: str):
    """
    Replace content between markers in README.md.
    """
    if not readme_path.exists():
        raise FileNotFoundError(f"{readme_path} not found")

    content = readme_path.read_text(encoding="utf-8")

    if README_MARKER_START not in content or README_MARKER_END not in content:
        raise ValueError(
            "README markers not found.\n"
            f"Please add:\n{README_MARKER_START}\n{README_MARKER_END}"
        )

    start_index = content.index(README_MARKER_START) + len(README_MARKER_START)
    end_index = content.index(README_MARKER_END)

    new_content = (
        content[:start_index]
        + "\n\n"
        + table_markdown
        + "\n\n"
        + content[end_index:]
    )

    readme_path.write_text(new_content, encoding="utf-8")


def main():
    repo_root = Path.cwd()
    solutions_dir = repo_root / "LeetCodeProblems/LeetCodeProblems/Solutions"
    readme_path = repo_root / "README.md"

    if not solutions_dir.exists():
        print("Solutions directory not found", file=sys.stderr)
        sys.exit(1)

    branch = os.getenv("README_BRANCH", "main")
    repo_url = get_repo_url()

    swift_files = find_swift_files(solutions_dir)
    table_markdown = build_markdown_table(swift_files, repo_url, branch)

    update_readme(readme_path, table_markdown)
    print(f"README updated with {len(swift_files)} .swift files.")


if __name__ == "__main__":
    main()