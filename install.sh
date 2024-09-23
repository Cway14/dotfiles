
git pull origin main;

# make all scripts executable
chmod -R +x ./scripts


elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Running linux install script..."
    ./scripts/linux/install.sh
else
    echo "OS not supported. Exiting..."
    exit
fi