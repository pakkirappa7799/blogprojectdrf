#!/bin/sh

ssh root@44.202.152.45 <<EOF
  cd /root/Pakkirappa/blogprojectdrf 
  git pull 
  source venv/bin/activate
  python manage.py makemigrations
  python manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
