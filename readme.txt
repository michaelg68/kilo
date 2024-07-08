Build Your Own Text Editor
https://viewsourcecode.org/snaptoken/kilo/




Using an SSH key to work with GitHub involves generating an SSH key pair, adding the public key to your GitHub account, and configuring your local Git repository to use SSH. Here are the detailed steps:

### Step 1: Generate an SSH Key
1. **Open a terminal** and run the following command to generate an SSH key:
   ```sh
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```
   If you're using a system that doesn’t support Ed25519, use RSA instead:
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

2. When prompted to "Enter a file in which to save the key," press Enter to accept the default file location.
3. Enter a secure passphrase when prompted (optional but recommended).

### Step 2: Add the SSH Key to the SSH Agent
1. **Start the ssh-agent** in the background:
   ```sh
   eval "$(ssh-agent -s)"
   ```

2. **Add your SSH private key** to the ssh-agent:
   ```sh
   ssh-add ~/.ssh/id_ed25519
   ```
   Or, if you used RSA:
   ```sh
   ssh-add ~/.ssh/id_rsa
   ```

### Step 3: Add the SSH Key to Your GitHub Account
1. **Copy the SSH public key** to your clipboard:
   ```sh
   cat ~/.ssh/id_ed25519.pub
   ```
   Or for RSA:
   ```sh
   cat ~/.ssh/id_rsa.pub
   ```

2. **Log in to GitHub** and navigate to the [SSH and GPG keys settings](https://github.com/settings/keys).
3. Click **New SSH key**.
4. **Paste your SSH key** into the "Key" field and add a descriptive title.
5. Click **Add SSH key**.

### Step 4: Configure Your Local Git Repository to Use SSH
1. **Navigate to your local project directory**:
   ```sh
   cd /path/to/your/local/project
   ```

2. **Change the remote URL** to use SSH:
   ```sh
   git remote set-url origin git@github.com:USERNAME/REPO_NAME.git
   ```
   Replace `USERNAME` with your GitHub username and `REPO_NAME` with your repository name.

### Step 5: Verify the SSH Configuration
1. **Test the SSH connection** to GitHub:
   ```sh
   ssh -T git@github.com
   ```
   You should see a message like:
   ```
   Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
   ```

### Step 6: Push to GitHub Using SSH
1. **Add your changes** to the staging area:
   ```sh
   git add .
   ```

2. **Commit your changes**:
   ```sh
   git commit -m "Your commit message"
   ```

3. **Push your changes** to GitHub:
   ```sh
   git push -u origin master
   ```
   If your default branch is `main`, use:
   ```sh
   git push -u origin main
   ```

### Example Commands
Here’s the sequence of commands you might use:

```sh
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add SSH private key to ssh-agent
ssh-add ~/.ssh/id_ed25519

# Copy SSH public key to clipboard
cat ~/.ssh/id_ed25519.pub

# Add SSH key to GitHub (via GitHub website)

# Navigate to your project directory
cd /path/to/your/local/project

# Change remote URL to SSH
git remote set-url origin git@github.com:USERNAME/REPO_NAME.git

# Test SSH connection
ssh -T git@github.com

# Add, commit, and push changes
git add .
git commit -m "Your commit message"
git push -u origin master  # or 'main' if that's your default branch
```

Now your local Git repository is configured to use SSH with GitHub, and you should be able to push and pull changes securely without being prompted for a username and password each time.




// 2024-07-08 - added SSH key on Zorin Linux on old Nata's Dell
