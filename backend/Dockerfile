FROM swipl:latest

WORKDIR /app

COPY server.pl /app/

COPY questao_*.pl /app/

EXPOSE 6358

CMD ["swipl", "server.pl"]
