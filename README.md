# alastria-tools
Alastria node easy installation

### buy a machine
    I suggest to use a standard Amazon EC2 instance (T2/4Gb/60GB). 
### buy a public IP
    geth uses P2P connections and is required to have a public IP for this purpose.
### open ports
    - 8443 TCP monitoring
    - 9000 TCP constellation P2P communication
    - 21000 TCP/UDP geth P2P communication
    - 22000 TCP geth RPC (maybe this must be secured or not widely open to internet ;D)
### machine setup
    - install docker (You can find some stuff about docker installation on aws_aim_scripts folder)
    - install git
### clone (git is required)
    git clone https://github.com/bloomenio/alastria-tools.git
### setup
    copy env.sh.example env.sh
    edit env.sh and add your configuration (public IP, node name, etc..)
### image creation (can take a few minutes)
    ./generate-alastria-image.sh
### join to Alastria
    At this point you have a regular node configured but you need to be allowed to join to Alastria.

    You need to make a Pull Request to the alastria-node github on the develop branch with your node data:
        - data/permissioned-nodes_validator.json
        - data/constellation-nodes.json
        - DIRECTORY_REGULAR.md 
    
    Here is a PR example used to configure our Bloomen Alastria node:
        - https://github.com/alastria/alastria-node/pull/273
  
    If you are a Bloomen partner you can send me the configuration and I will make the PR for you ;D

### start your Alastria node     
     ./start-alastria-node.sh       
### wait until you node is synchronized
    You need to wait until the PR is merged and VALIDATOR nodes takes the new configuration. After this you can see your node on http://netstats.testnet.alastria.io.builders/ and wait until it is fully synchronized.

### enjoy!


