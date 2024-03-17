#!/bin/bash

#############
#Author :  Ahsan
#Date : 18th March
#Version : 1

#GitHub username and personal access token

USERNAME=$username
TOKEN=$token

#user and Repository information
REPO_OWNER=$1
REPO_NAME=$2



# Function to make a GET  request to the GitHUb API

function github_api_get {
	local endpoint="$1"
	local url="${API_URL}/${endpoint}"

   #send a  GET request to the GitHub API with authentication
   	curl -s -u "${USERNAME}:${TOKEN}" "$URL"

   }

 #Function to list of collaborators on the repository
function list_users_with_read_access {
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"


	#fetch the list of collaborators on the repositort
	collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

 if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access





######## Documentation ############################
#    Version: 1: Indicates the version number of the script.

#Variables:

#    USERNAME and TOKEN: GitHub username and personal access token. These are used for authentication when making requests to the GitHub API.
 #   REPO_OWNER and REPO_NAME: Variables that should be passed as arguments when running the script. They represent the owner (username or organization) and the name of the repository on GitHub.
#This script appears to be a bash script intended to interact with the GitHub API. Let's break down its components and explain each part:
#funtion

#  github_api_get:
#This function is used to make a GET request to the GitHub API.
#    Parameters:
#  endpoint: The specific endpoint of the GitHub API.
#  It constructs the URL using the provided endpoint and the base URL stored in API_URL.
# Uses curl to send a GET request to the constructed URL with authentication using the provided USERNAME and TOKEN.
#Note: There's a typo in the function where #$URL should be #$url" to use the variable correctly.

#list_users_with_read_access:
#This function lists collaborators with read access to the specified repository.
#It constructs the endpoint for listing collaborators based on the provided REPO_OWNER and REPO_NAME.
#Calls the github_api_get function with the constructed endpoint to fetch the list of collaborators.
#Uses jq to parse the JSON response and extract the usernames of collaborators with read access.
#Checks if there are any collaborators with read access. If not, it prints a message indicating so. Otherwise, it lists the collaborators.


#Main Execution:
# Prints a message indicating that it's listing users with read access to the specified repository.
# Calls the list_users_with_read_access function.


#Explanation:

#The script uses environment variables for authentication, allowing the script to interact with the GitHub API on behalf of the provided user.
#It defines functions to abstract away API interactions and collaborator listing logic.
#There's an error in the github_api_get function where $URL should be "$url.
#The script could be enhanced by adding error handling and improving readability.
