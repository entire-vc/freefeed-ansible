# Deploying FreeFeed

Requirements:
* ansible
* debian
* docker

stable/candy:

    ansible-playbook -vv -i stable playbooks/server.yml
    ansible-playbook -vv -i stable playbooks/frontend.yml

release/production:

    ansible-playbook -vv -i release playbooks/server.yml -e freefeed_server_version='freefeed_release_1.82.2'
    ansible-playbook -vv -i release playbooks/frontend.yml -e react_client_version='freefeed_release_1.82.1'

