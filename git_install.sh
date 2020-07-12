sudo apt-get install git
mkdir .ssh
cd .ssh
ssh-keygen
echo “—————————————“
cat id_rsa.pub 
echo “—————————————“
echo “gitに公開鍵を設定” 
eval `ssh-agent`
ssh-add
