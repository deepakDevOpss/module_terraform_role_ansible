# module_terraform_role_ansible

<h2> This will help you to install prerequisites and how to create infrastructure using these modules </h2>

<h3> Install prerequisites </h3>

<ul>
<li> The build-essentials packages are meta-packages that are necessary for compiling software. They include the GNU debugger, g++/GNU compiler collection,and some more tools and libraries that are required to compile a program.</li>

```
sudo apt-get update 

sudo apt-get install build-essential

```

<li> Docker is an application that simplifies the process of managing application processes in containers. Containers let you run your applications in  resource-isolated processes. </li>

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
  
<li> Install Ansible</li>
  
  ```
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible
  ```
</ul>

<h3> how to use </h3>
<ul>
<li> The vars.yaml file has to be modify first(contains terraform variables)</li>
  
<li> Then after this command has to be run 
  
  ```
  make modify_var_file
  ``` 
  which wll move the file in the Terraform_Code folder.</li>
  
<li> We have to build the Dockerfile</li>
  
  ```
  make build_terraform
  ```
  
<li> To run the container we have to use this command</li>
  
  ```
  make run_terraform
  ```
  
<li> To create infrastructure we have to run this command</li>
  
  ```
  make apply_terraform
  ```
</ul>

<ul>
<li> Defining variables at runtime(Ansible)</li>
  
  ```
  ansible-playbook site.yml --extra-vars "version=1.23.45 other_variable=foo"
  ```
 
<li> Ansible runs or skips all role with tags that match the tags you pass at the command line</li>
  
  ```
  ansible-playbook site.yaml --tags "nodejs"
  ```
</ul>




