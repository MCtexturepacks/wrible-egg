#! /bin/sh

cd /home/container || exit 1;

if [[ -f "/home/container/theme.js" ]]; then
  pm2 start --name=dashboardsy npm -- start
else
  echo "dahsboarsdsy not found. Proceed to install Dashactyl? (Y/N)";
  read proceed;

  case "$proceed" in
    "Y")
        echo "Installing Dashactyl...";

        git clone https://github.com/Wrible-Development/Dashboardsy.git /home/container/dashboardsy
        mv /home/container/dashboardsy/** /home/container
        rm -rf /home/container/dashboardsy
        npm install
        npm install -g pm2
        npm run build

        yarn install

        echo "Fyreactyl is now installed. Please open settings.yml and follow the guide to fill out the details: https://docs.votion.dev/docs/Dashactyl/configuration";
        exit 0;
        ;;
    "N")
        exit 0;
        ;;
    *)
        exit 1;
        ;;
    esac
fi
