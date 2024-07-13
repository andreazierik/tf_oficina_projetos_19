# tf_oficina_projetos_19
Repositório para armazenar os módulos do Terraform, para provisionar a infraestrutura referente a migração da loja virtual "TechStore".

Arquitetura Proposta
Balanceamento de Carga:

AWS Elastic Load Balancer (ELB): Distribui o tráfego de rede entre várias instâncias EC2, garantindo alta disponibilidade.
Servidor Web e Aplicação:

AWS Auto Scaling Group (ASG): Cria e remove instâncias EC2 automaticamente com base na demanda. Use instâncias do tipo t3.medium ou m5.large, conforme necessário.
Amazon Elastic File System (EFS): Sistema de arquivos compartilhado entre várias instâncias EC2 para armazenar arquivos estáticos do Magento.
Banco de Dados:

Amazon RDS (MySQL ou Aurora): Banco de dados gerenciado e escalável. Utilize o recurso Multi-AZ para alta disponibilidade e read replicas para leitura escalável.
Armazenamento:

Amazon S3: Armazenamento de objetos para backups, mídia estática e logs. Use políticas de ciclo de vida para gerenciar o armazenamento.
Amazon S3 Glacier: Para arquivamento de dados antigos.
Distribuição de Conteúdo:

Amazon CloudFront: CDN para entregar conteúdo estático e dinâmico com baixa latência globalmente. Integração com S3 para distribuir arquivos estáticos.
Segurança:

AWS WAF: Protege contra ataques na camada de aplicação, incluindo DDoS.
AWS Shield: Proteção DDoS avançada.
Amazon GuardDuty: Monitoramento contínuo de atividades maliciosas e comportamentos não autorizados.
AWS Secrets Manager: Gerenciamento seguro de segredos e credenciais.
Monitoramento e Logging:

Amazon CloudWatch: Monitoramento de métricas de performance e logs.
AWS CloudTrail: Registro de atividades da conta AWS para auditoria.
Rede:

Amazon VPC: Rede isolada para recursos da AWS. Utilize sub-redes públicas e privadas para isolar os recursos.
AWS Direct Connect: Se necessário, para uma conexão de alta largura de banda e baixa latência com a AWS.
Fluxo de Migração
Planejamento:

Avaliação detalhada da infraestrutura atual.
Planejamento de capacidade e dimensionamento adequado para a AWS.
Desenho de arquitetura.
Configuração Inicial:

Configuração do VPC, sub-redes, gateways NAT e rotas.
Implementação do ELB, ASG e instâncias EC2 com Magento.
Configuração do RDS e migração do banco de dados.
Migração de Dados:

Transferência de dados para S3 e configuração do EFS.
Sincronização dos dados do banco de dados.
Segurança e Proteção:

Configuração de WAF, Shield e GuardDuty.
Configuração de políticas de segurança e grupos de segurança.
Otimização e Testes:

Configuração de auto scaling e tuning de performance.
Testes de carga para validar a capacidade e a performance.
Testes de segurança.
Corte e Monitoramento:

Redirecionamento do tráfego para a nova infraestrutura na AWS.
Monitoramento contínuo com CloudWatch e ajustes necessários.