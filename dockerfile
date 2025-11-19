FROM arm64v8/node:current-alpine

RUN adduser -D foundry
RUN mkdir -p /home/foundry/fvtt
RUN mkdir -p /home/foundry/fvttdata

ENV FOUNDRY_HOME=/home/foundry/fvtt
ENV FOUNDRY_DATA=/home/foundry/fvttdata

WORKDIR "${FOUNDRY_HOME}"

ADD  ./FoundryVTT-10.291.zip .

RUN unzip FoundryVTT*.zip
RUN rm FoundryVTT*.zip

EXPOSE 30000

CMD node ${FOUNDRY_HOME}/resources/app/main.js --dataPath=${FOUNDRY_DATA}
