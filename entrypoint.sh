#! /bin/sh

cd /home/container || exit 1;

if [[ -f "/home/container/index.php the
  node index.php
else
  echo "dahsboarsdsy not found. Proceed to install Dashactyl? (Y/N)";
  read proceed;

  case "$proceed" in
    "Y")
        echo "Installing Dashactyl...";

        git clone https://github.com/ShadowsDash/ShadowsDash.git /home/container/shadows
        mv /home/container/shadows/** /home/container
        rm -rf /home/container/shadows

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
