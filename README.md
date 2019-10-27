# Course 046195 - Introduction to Machine learning

Website: <https://technion046195.github.io/semester_2019_winter/>

Full website (with hidden pages): <https://technion046195.github.io/semester_2019_winter/?full>

## Running the Server Locally Using Docker

- Install docker

``` bash
if [ "$(lsb_release -r | awk '{print $2}')" == "14.04" ]; then
    sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual  # allow Docker to use the aufs storage
fi
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common  # allow apt to use a repository over HTTPS
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  # Add Docker’s official GPG key
## Verify that the key fingerprint is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88: sudo apt-key fingerprint 0EBFCD88
ubuntu_codename="$(lsb_release -cs)"
if [ "$ubuntu_codename" == "cosmic" ]; then
    ubuntu_codename="bionic"
fi
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $ubuntu_codename stable"
sudo apt-get update
sudo apt-get install -y docker-ce
## Test docker installation: sudo docker run hello-world

sudo groupadd docker  # create a docker group
sudo usermod -aG docker $USER  # Add user to docker group for using docker without sudo
```

- Build the docker file once using the following command:

``` bash
docker build . -t course046195
```

- Then you can run the server using the following command:

``` bash
docker run --rm -it -v "$PWD:/app" -p 4444:4444 -p 35729:35729 course046195
```

- Open the browser at: <localhost:4444>

## Known Issus

- Apparently in markdown the convention is to use the double dollar sign ("$$") for both inline and display equations.

- For some reason Jekyll replaces the combination "\{" with "{". This is problematic when trying to use curly brackets in LaTeX equations such as "\left\{x\right\}". A workaround is to use "\lbrace" and "rbrace" instead: "\left\brace x\right\rbrace"
