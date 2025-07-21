#!/bin/sh

git_url:"https://github.com/StudioAlbert/UnityEmpty.git"
git_message:"first commit"

echo "# UnityEmpty" >> README.md
git init

#Get an ignore file
wget -O ".gitignore" "https://github.com/github/gitignore/blob/main/Unity.gitignore"
# Verify download
if [ $? -eq 0 ]; then
    echo "Download successful: .gitignore"
else
    echo "Failed to download .gitignore"

    read -p "Press Enter to exit."
    exit 1
fi


#Get an ignore file
wget -O ".gitattributes" "https://github.com/gitattributes/gitattributes/blob/master/Unity.gitattributes"
# Verify download
if [ $? -eq 0 ]; then
    echo "Download successful: .gitignore"
else
    echo "Failed to download .gitignore"
    
    read -p "Press Enter to exit."
    exit 1
fi

git add .
git commit -m "$git_message"
git branch -M main
git remote add origin "$git_url"
git push -u origin main

# Pause the script
read -p "Press Enter to continue or Ctrl+C to exit."
echo "Resuming script..."