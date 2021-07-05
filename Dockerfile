FROM perl:5.34

WORKDIR /app
EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["prodserver"]

ENV PERL_CARTON_PATH="/carton/local" \
  PATH="/carton/local/bin:${PATH}" \
  PERL5LIB="/carton/local/lib/perl5:/carton/local/lib/perl5/x86_64-linux-gnu:${PERL5LIB}"

COPY cpanfile* .
RUN cpanm Carton
RUN carton install --deployment

COPY . .
COPY docker-entrypoint.sh /bin
