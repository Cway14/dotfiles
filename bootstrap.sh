
git pull origin main;

# make all scripts executable
chmod -R +x ./scripts

# run install script based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running mac install script..."
    ./scripts/mac/install.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Running linux install script..."
    ./scripts/linux/install.sh
else
    echo "OS not supported. Exiting..."
    exit
fi