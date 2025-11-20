# Use Node.js 20 como base
FROM node:20-bullseye

ENV FOUNDRY_HOME=/data
ENV FOUNDRY_PORT=30000

# Cria o diretório de dados
RUN mkdir -p $FOUNDRY_HOME
WORKDIR $FOUNDRY_HOME

# Copia qualquer arquivo Foundry VTT zip da pasta Downloads
COPY ./Downloads/FoundryVTT-*.zip ./

# Instala unzip e descompacta
RUN apt-get update && apt-get install -y unzip && \
    unzip FoundryVTT-*.zip && rm FoundryVTT-*.zip

# Instala dependências do Node
RUN npm install --production

# Exponha a porta
EXPOSE 30000

# Comando padrão para rodar o Foundry
CMD ["node", "resources/app/main.js", "--data", "/data", "--port", "30000"]

