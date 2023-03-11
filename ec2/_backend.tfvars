#
# Neste aquivo iremos configurar os parâmetros necessários para o funcionamento
# do nosso Backend do Terraform.

# Backend é um mecanismo para armazenar o nosso state de forma remota e possibilitar
# o trabalho de uma equipe atuando na mesma infraestrutura.
#
# Para mais informações sobre como usar backends no terraform, voce pode consultar
# no link: https://www.terraform.io/docs/configuration/backend.html
#


#
# Nome do bucket onde será configurado nosso backend
#
#bucket = "Inserir um bucket"
bucket = "s3-pessoal-ec2-cka"

#
# Aqui deverá ser colocado a região em que o bucket acima foi criado
#
region = "us-east-1"

#
# Nome do profile configurado no aws-cli que contem as credenciais de acesso a AWS
# Para mais informações, consulte: https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-configure-profiles.html
#
#profile="mip"

#
# Aqui deverá ser colocado o caminho que ira conter o estado o terraform
#
key = "terraform/k8s/dev/infra/infra.tfstate"