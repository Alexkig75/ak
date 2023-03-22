import requests

# GitHub repository information
username = "your_username"
access_token = "your_access_token"
repo_name = "your_repo_name"

# API endpoint
api_base_url = "https://api.github.com"
pr_url = f"{api_base_url}/repos/{username}/{repo_name}/pulls"

# Fetch the pull requests
headers = {
    "Authorization": f"token {access_token}",
    "Accept": "application/vnd.github.v3+json"
}
response = requests.get(pr_url, headers=headers)

if response.status_code == 200:
    prs = response.json()
    print(f"Total pull requests in {repo_name}: {len(prs)}")
    for pr in prs:
        print(f"Title: {pr['title']}")
        print(f"URL: {pr['html_url']}")
        print(f"Author: {pr['user']['login']}")
        print(f"Created at: {pr['created_at']}")
        print(f"Updated at: {pr['updated_at']}")
        print(f"State: {pr['state']}")
        print("")
else:
    print(f"Failed to fetch pull requests for {repo_name}. Error message: {response.text}")
