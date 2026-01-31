Mandatory Action for your Other Device:
To prevent this from happening again (Groundhog Day loop), you MUST do the following on your other device immediately:

Discard Public Changes:
bash
# Go to the PUBLIC folder on the other device
cd RedLemon-Public
git fetch origin
git reset --hard origin/main
Update Private Repo:
bash
# Go to the PRIVATE folder on the other device
cd RedLemon-Native
git pull origin main-4-GLM
Install Hooks:
bash
# On the other device
./scripts/install_hooks.sh
If you don't do this, the next time you run a release from that device, it will re-upload the sensitive files because it's using the old 
sync-to-public.sh
 script.

Can you confirm you will perform these updates on the other machine?