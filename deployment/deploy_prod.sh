#!/bin/sh

ssh root@44.202.152.45<<EOF
  cd /Pakkirappa/blogprojectdrf 
  git pull 
  source venv/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
