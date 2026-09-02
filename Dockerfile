FROM alpine:latest
COPY hello.sh /hello.sh
RUN chmod +x /hello.sh
CMD ["sh", "/hello.sh"]
