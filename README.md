# module_terraform_role_ansible

<h2> This will help you to install required prerequisites and how to create infrastructure using these modules </h2>

<h3> install prerequisites </h3>

<li> The build-essentials packages are meta-packages that are necessary for compiling software. They include the GNU debugger, g++/GNU compiler collection,      and some more tools and libraries that are required to compile a program.</li>

```
sudo apt-get update 

sudo apt-get install build-essential

```

<ul>
<li> Docker is an application that simplifies the process of managing application processes in containers. Containers let you run your applications in          resource-isolated processes. </li>

```
sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

apt-cache policy docker-ce

sudo apt install docker-ce
```

<li> Executing the Docker Command Without Sudo </li>
  
```
sudo usermod -aG docker ${USER}

su - ${USER}

sudo usermod -aG docker ${USER}

```
</ul>




